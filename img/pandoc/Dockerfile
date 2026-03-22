ARG VENDOR="vendor"

FROM ${VENDOR}/alpine:latest AS final

RUN apk add --no-cache pandoc

COPY entrypoint.sh /

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
