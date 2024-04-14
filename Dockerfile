FROM ubuntu:23.04

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true
ENV WORK_DIR /data

VOLUME $WORK_DIR
WORKDIR $WORK_DIR

RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | sudo debconf-set-selections

RUN sudo apt update

RUN sudo apt install --no-install-recommends -y \
    wget \
    git \
    make \
    apt-transport-https \
    unzip \
    texlive-base \
    texlive-latex-extra \
    texlive-xetex \
    texlive-lang-cyrillic \
    texlive-science \
    texlive-latex-recommended \
    latexmk \
    ttf-mscorefonts-installer \
    fonts-freefont-ttf \
    fontconfig \
    ghostscript
  wget https://github.com/stipub/stixfonts/raw/master/zipfiles/static_otf.zip
  sudo unzip -o static_otf.zip -d /usr/share/fonts/
  rm -f static_otf.zip
  fc-cache -f -v
