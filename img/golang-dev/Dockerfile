ARG VENDOR="vendor"

FROM ${VENDOR}/golang:latest AS golang
FROM ${VENDOR}/alpine:latest AS final

RUN apk add --no-cache bash gcc libc-dev binutils binutils-gold make git jq openssl

COPY --from=golang /usr/local/go /usr/local/go

ENV PATH=$PATH:/usr/local/go/bin
ENV CGO_ENABLED=0

RUN go install github.com/hairyhenderson/gomplate/v3/cmd/gomplate@latest \
    && go install golang.org/x/tools/cmd/goimports@latest \
    && go install mvdan.cc/gofumpt@latest \
    && go install go.uber.org/mock/mockgen@latest \
    && go install github.com/golangci/golangci-lint/v2/cmd/golangci-lint@latest \
    && go install golang.org/x/vuln/cmd/govulncheck@latest \
    && go install github.com/google/go-licenses/v2@latest \
    && mv /root/go/bin/* /usr/local/bin \
    && rm -rf /root/go /root/.cache /tmp/* /var/tmp/*

COPY entrypoint.sh /

RUN adduser -D -h /home/commander -s /bin/bash commander

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
