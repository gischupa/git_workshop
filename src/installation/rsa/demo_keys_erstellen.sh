for i in $(seq -w 1 10); do
  ssh-keygen -t rsa -b 2048 \
    -f demo_user${i}_rsa \
    -N "" \
    -C "user${i}@demo.local"
done

# statt $(seq -w 1 10)  auch möglich:   for i in {1..10} 
