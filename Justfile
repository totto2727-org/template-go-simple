set shell := ["bash", "-euo", "pipefail", "-c"]

default: ci

fix:
    golangci-lint fmt
    golangci-lint run --fix ./...

check:
    golangci-lint fmt --diff
    golangci-lint run ./...

build:
    go build -o ./_build/project .

test:
    go test -race ./...

run:
    go run .

ci: check build test
