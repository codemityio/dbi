FROM codemity/golang:latest AS final

RUN apk update \
    && apk upgrade \
    && apk add make git jq bash \
    && go install github.com/hairyhenderson/gomplate/v3/cmd/gomplate@latest \
    && go install golang.org/x/tools/cmd/goimports@latest \
    && go install mvdan.cc/gofumpt@latest \
    && go install github.com/daixiang0/gci@latest \
    && go install github.com/google/go-licenses@latest \
    && go install go.uber.org/mock/mockgen@latest \
    && go install github.com/golangci/golangci-lint/v2/cmd/golangci-lint@latest \
    && go install golang.org/x/vuln/cmd/govulncheck@latest \
    && go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest \
    && go install github.com/golang-migrate/migrate/v4/cmd/migrate@latest
