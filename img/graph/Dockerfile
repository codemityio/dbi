ARG VENDOR="vendor"

FROM ${VENDOR}/alpine:latest AS final

ENV LANGUAGE=en_US.UTF-8
ENV LANG=C.UTF-8

WORKDIR /opt/app

COPY --from=ghcr.io/plantuml/plantuml:latest /opt/plantuml.jar /usr/local/lib/plantuml.jar

RUN apk add --no-cache \
        pandoc \
        graphviz \
        openjdk11-jre \
        chromium \
        nodejs \
        npm \
        nss \
        dumb-init \
        libc6-compat \
        ttf-droid font-droid-nonlatin font-noto-cjk font-noto-emoji terminus-font ttf-dejavu ttf-freefont ttf-font-awesome ttf-inconsolata ttf-linux-libertine \
    && npm install -g --omit=dev --no-update-notifier --no-fund @mermaid-js/mermaid-cli \
    && npm cache clean --force \
    && fc-cache -f && rm -rf /tmp/* /var/tmp/*
