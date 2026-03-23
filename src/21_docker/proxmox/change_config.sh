#!/bin/bash

HOST_IFACE=""
HOST_IP=""
HOST_CIDR=""
GATEWAY=""
VM_SUBNET=""
VM_BRIDGE_IP=""
NIC=""

function finde_konfig {
# Finde die erste aktive Schnittstelle mit einer IPv4-Adresse außer loopback
HOST_IFACE=$(ip -4 addr show up | grep -v "lo" | grep -oP '(?<=: ).*?(?=:)'|grep 0)
HOST_IP=$(ip -4 addr show $HOST_IFACE | grep -oP '(?<=inet\s)\d+\.\d+\.\d+\.\d+')
HOST_CIDR=$(ip -4 addr show $HOST_IFACE | grep -oP '(?<=inet\s)\d+\.\d+\.\d+\.\d+/\d+')
GATEWAY=$(ip route | awk '/default/ {print $3}')
NIC=$(ip -o link show | awk -F': ' '/^[0-9]+: / {
    if ($2 !~ /^(lo|vmbr|tap|fwbr|fwpr|fwln)/) print $2
}' | head -n1)
}


function definiere_netz {
# VM-Subnetz auswählen nach Host-IP-Bereich
if [[ $HOST_IP == 192.* ]]; then
    VM_SUBNET="172.16.100.0/24"
    VM_BRIDGE_IP="172.16.100.1"
elif [[ $HOST_IP == 172.* ]]; then
    VM_SUBNET="192.168.100.0/24"
    VM_BRIDGE_IP="192.168.100.1"
elif [[ $HOST_IP == 10.* ]]; then
    VM_SUBNET="192.168.100.0/24"
    VM_BRIDGE_IP="192.168.100.1"
else
    # Fallback
    VM_SUBNET="192.168.100.0/24"
    VM_BRIDGE_IP="192.168.100.1"
fi
}


function erstelle_systemd_service {
    SERVICE_FILE="/etc/systemd/system/proxmox-vm-nat.service"
    cat <<EOF > $SERVICE_FILE
[Unit]
Description=Proxmox VM NAT und Portforward
After=network.target

[Service]
Type=oneshot
ExecStart=/usr/local/sbin/proxmox-vm-nat.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

    systemctl daemon-reload
    systemctl enable --now proxmox-vm-nat.service
}


function schreibe_interfaces {
    INTERFACES_FILE=/etc/network/interfaces
    cat <<EOF > $INTERFACES_FILE
auto lo
iface lo inet loopback

iface $NIC inet manual

auto vmbr0
iface vmbr0 inet static
        address $HOST_CIDR
        gateway $GATEWAY
        bridge-ports $NIC
        bridge-stp off
        bridge-fd 0

auto vmbr1
iface vmbr1 inet static
        address ${VM_BRIDGE_IP}/24
        bridge-ports none
        bridge-stp off
        bridge-fd 0

post-up echo 1 > /proc/sys/net/ipv4/ip_forward
post-up iptables -t nat -A POSTROUTING -s '$VM_SUBNET' -o vmbr0 -j MASQUERADE
post-down iptables -t nat -D POSTROUTING -s '$VM_SUBNET' -o vmbr0 -j MASQUERADE
source /etc/network/interfaces.d/*
EOF

sleep 5

ip link set vmbr1 up

}

function erstelle_nat_script {
    NAT_SCRIPT="/usr/local/sbin/proxmox-vm-nat.sh"
    cat <<EOF > $NAT_SCRIPT
#!/bin/bash
# Aktiviert IP Forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -F

# NAT für VM-Bridge
iptables -t nat -A POSTROUTING -s '$VM_SUBNET' -o vmbr0 -j MASQUERADE

# Aktuelle Portweiterleitungen
VM_IP=172.16.100.10

# Für Gitea
iptables -t nat -A PREROUTING -i vmbr0 -p tcp --dport 4000 -j DNAT --to-destination \$VM_IP:4000

# Für Lighttpd u.ä.
iptables -t nat -A PREROUTING -i vmbr0 -p tcp --dport 8080 -j DNAT --to-destination \$VM_IP:8080

# Für ssh zur VM
iptables -t nat -A PREROUTING -i vmbr0 -p tcp --dport 22 -j DNAT --to-destination \$VM_IP:22

# GitLab
iptables -t nat -A PREROUTING -i vmbr0 -p tcp --dport 443 -j DNAT --to-destination $VM_IP:443

# nginx
iptables -t nat -A PREROUTING -i vmbr0 -p tcp --dport 81 -j DNAT --to-destination $VM_IP:81
iptables -t nat -A PREROUTING -i vmbr0 -p tcp --dport 80 -j DNAT --to-destination $VM_IP:80

# Rückweg
iptables -t nat -A POSTROUTING -s $VM_IP -o vmbr0 -j MASQUERADE


EOF
    chmod +x $NAT_SCRIPT
}

function erstelle_systemd_service {
    SERVICE_FILE="/etc/systemd/system/proxmox-vm-nat.service"
    cat <<EOF > $SERVICE_FILE
[Unit]
Description=Proxmox VM NAT und Portforward
After=network.target

[Service]
Type=oneshot
ExecStart=/usr/local/sbin/proxmox-vm-nat.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

    systemctl daemon-reload
    systemctl enable --now proxmox-vm-nat.service
}

finde_konfig
definiere_netz

echo "Gefundene Schnittstelle: $HOST_IFACE"
echo "Host-IP: $HOST_IP"
echo "Host-Netz CIDR: $HOST_CIDR"
echo "Ausgewähltes VM-Subnetz: $VM_SUBNET"
echo "VM-Bridge-IP: $VM_BRIDGE_IP"

schreibe_interfaces
erstelle_nat_script
erstelle_systemd_service

# Umbiegen des ssh auf Port 222
sed -i -e "s/#Port 22/Port 222/g" /etc/ssh/sshd_config
systemctl deamon-reload
systemctl restart ssh
systemctl restart networking


