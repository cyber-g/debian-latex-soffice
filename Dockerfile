FROM debian:buster-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    make \
    git\
    texlive-full \
    latexmk \
    xfig \
    inkscape \
    gnuplot \
    python-pygments \
    python3-pygments \
    source-highlight \
    fonts-inconsolata \
    libreoffice \
    wget \
    imagemagick \
    pandoc \
    ssh-client \
    zip \
    && apt-get clean    

# https://stackoverflow.com/questions/53377176/change-imagemagick-policy-on-a-dockerfile
ARG imagemagic_config=/etc/ImageMagick-6/policy.xml
RUN if [ -f $imagemagic_config ] ; then sed -i 's/<policy domain="coder" rights="none" pattern="PDF" \/>/<policy domain="coder" rights="read|write" pattern="PDF" \/>/g' $imagemagic_config ; else echo did not see file $imagemagic_config ; fi

RUN apt-get install -y pandoc-citeproc

RUN apt-get install -y octave

RUN apt-get install -y poppler-utils python3-pip
RUN pip3 install pandoc-fignos pandoc-eqnos pandoc-tablenos pandoc-secnos


RUN echo 'deb http://deb.debian.org/debian buster-backports main' >> /etc/apt/sources.list.d/backports.list
RUN apt-get update
RUN apt-get install -y python3-cairosvg
