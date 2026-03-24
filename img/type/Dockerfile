ARG VENDOR="vendor"

FROM ${VENDOR}/alpine:latest AS final

RUN apk add --no-cache bash nodejs npm \
    && npm install -g --omit=dev --no-update-notifier --no-fund quicktype json-schema-to-typescript \
    && npm cache clean --force \
    && rm -rf /var/cache/apk/* /tmp/* /var/tmp/*
