FROM tarikgraba/debian-latex

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libreoffice

RUN apt-get install -y wget imagemagick