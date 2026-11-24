FROM debian:buster-slim

RUN echo 'deb http://deb.debian.org/debian buster-backports main' > /etc/apt/sources.list.d/backports.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    fonts-inconsolata \
    git \
    gnuplot \
    imagemagick \
    inkscape \
    latexmk \
    libreoffice \
    make \
    octave \
    pandoc \
    pandoc-citeproc \
    poppler-utils \
    python-pygments \
    python3-cairosvg \
    python3-pip \
    python3-pygments \
    source-highlight \
    ssh-client \
    texlive-full \
    wget \
    xfig \
    zip \
    && apt-get clean \
    && rm -fr /usr/share/doc/texlive-doc

# https://stackoverflow.com/questions/53377176/change-imagemagick-policy-on-a-dockerfile
ARG imagemagic_config=/etc/ImageMagick-6/policy.xml
RUN if [ -f $imagemagic_config ] ; then sed -i 's/<policy domain="coder" rights="none" pattern="PDF" \/>/<policy domain="coder" rights="read|write" pattern="PDF" \/>/g' $imagemagic_config ; else echo did not see file $imagemagic_config ; fi

RUN pip3 install pandoc-fignos pandoc-eqnos pandoc-tablenos pandoc-secnos
