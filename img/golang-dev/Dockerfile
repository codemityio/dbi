ARG VENDOR="vendor"

FROM ${VENDOR}/golang:latest AS golang
FROM ${VENDOR}/alpine:latest AS final

RUN apk add --no-cache make git jq bash

COPY --from=golang /usr/local/go /usr/local/go

ENV GOPATH=/go
ENV PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

RUN go install github.com/hairyhenderson/gomplate/v3/cmd/gomplate@latest \
    && go install golang.org/x/tools/cmd/goimports@latest \
    && go install mvdan.cc/gofumpt@latest \
    && go install go.uber.org/mock/mockgen@latest \
    && go install github.com/golangci/golangci-lint/v2/cmd/golangci-lint@latest \
    && go install golang.org/x/vuln/cmd/govulncheck@latest \
    && rm -rf /go/pkg /go/src /root/.cache /tmp/* /var/tmp/*
