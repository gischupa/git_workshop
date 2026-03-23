FROM python:3.9

RUN wget "https://github.com/quarto-dev/quarto-cli/releases/download/v1.6.33/quarto-1.6.33-linux-amd64.deb" && dpkg -i quarto-1.6.33-linux-amd64.deb

RUN pip install jupyter
RUN quarto install tinytex
RUN /root/.TinyTeX/bin/x86_64-linux/tlmgr install blindtext boxedminipage braille circuitikz pgf-blur svn-prov tikzlings tkz-euclide

CMD ["tail", "-f", "/dev/null"]
