FROM debian:trixie-slim

RUN echo 'deb http://deb.debian.org/debian trixie-backports main' > /etc/apt/sources.list.d/backports.list \
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
    pipx \
    poppler-utils \
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
# The glob covers both the ImageMagick-6 and ImageMagick-7 configuration directories.
RUN for imagemagic_config in /etc/ImageMagick-*/policy.xml ; do if [ -f "$imagemagic_config" ] ; then sed -i 's/<policy domain="coder" rights="none" pattern="PDF" \/>/<policy domain="coder" rights="read|write" pattern="PDF" \/>/g' "$imagemagic_config" ; else echo did not see file "$imagemagic_config" ; fi ; done

# Debian enforces PEP 668, so the Python filters go through pipx,
# with their executables in /usr/local/bin for every user.
ENV PIPX_HOME=/opt/pipx \
    PIPX_BIN_DIR=/usr/local/bin
RUN pipx install pandoc-fignos pandoc-eqnos pandoc-tablenos pandoc-secnos
