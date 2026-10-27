ARG VENDOR="vendor"

FROM ${VENDOR}/alpine:latest AS final

COPY --from=golang:1.27.3-alpine3.24 /usr/local/go /usr/local/go

ENV PATH=$PATH:/usr/local/go/bin
