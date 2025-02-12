FROM ubuntu:23.04

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true
ENV WORK_DIR /data

VOLUME $WORK_DIR
WORKDIR $WORK_DIR

RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections
RUN apt update && \
    apt install --no-install-recommends -y \
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
        texlive-fonts-extra \
        texlive-plain-generic \
        latexmk \
        ttf-mscorefonts-installer \
        fonts-freefont-ttf \
        fontconfig \
        ghostscript \
        cm-super
