<<<<<<< HEAD
FROM debian:buster-slim
=======
FROM debian:stable-slim
>>>>>>> 554968efce5a62b7a9a90527861a91fc54cfe7d6

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
    && apt-get clean    

# https://stackoverflow.com/questions/53377176/change-imagemagick-policy-on-a-dockerfile
ARG imagemagic_config=/etc/ImageMagick-6/policy.xml
RUN if [ -f $imagemagic_config ] ; then sed -i 's/<policy domain="coder" rights="none" pattern="PDF" \/>/<policy domain="coder" rights="read|write" pattern="PDF" \/>/g' $imagemagic_config ; else echo did not see file $imagemagic_config ; fi

