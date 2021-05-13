FROM tarikgraba/debian-latex

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libreoffice \
    wget