set shell := ["bash", "-euo", "pipefail", "-c"]

default: ci

fix:
    golangci-lint fmt
    golangci-lint run --fix ./...

check:
    golangci-lint fmt --diff
    golangci-lint run ./...

build: build-go build-nix

build-go:
    go build -o ./_build/project .

build-nix:
    nix build .#project

test:
    go test -race ./...

run:
    go run .

run-nix:
    nix run .

ci: check build test
