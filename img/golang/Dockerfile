ARG VENDOR="vendor"

FROM ${VENDOR}/alpine:latest AS final

COPY --from=golang:1.26.2-alpine3.23 /usr/local/go /usr/local/go

ENV PATH=$PATH:/usr/local/go/bin
