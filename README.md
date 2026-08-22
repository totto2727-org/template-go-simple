# Go Simple CLI Template

A GitHub repository template for a small Go command-line application with a dependency-free sample and reproducible Go and Nix execution paths.

## Usage

The template includes a minimal command that can be run from source or through the Nix package:

```console
$ go run .
Hello, world!

$ nix run .
Hello, world!
```

## Key features

- Dependency-free Hello World CLI built with the Go standard library
- Reproducible Nix package and reusable overlay
- Direct execution from source with Go
- Optional reproducible execution through the Nix package

## Prerequisites

- **GitHub CLI** (optional): Run the documented creation command; GitHub's **Use this template** flow can be used instead.
- **Go 1.25 or later**: Required to run the command from source with `go run .`.
- **Nix with flakes enabled**: Optional alternative for running the packaged command with `nix run .`.

## Setup

1. Create and clone a repository from the template with GitHub CLI, or use GitHub's **Use this template** flow and clone it normally:

```bash
gh repo create username/project --template totto2727-org/template-go-simple --public --clone
cd project
```

## API

### `project`

Runs the sample command and prints `Hello, world!`.
The command defines no options or arguments, and any supplied arguments are ignored.
It writes exactly `Hello, world!` followed by a newline to standard output, writes nothing to standard error, and exits with status `0`.
The sample defines no application-level failure condition; failures are limited to the Go or Nix launcher being unable to build or start the command.

```console
$ go run .
Hello, world!
```

## Development

For template initialization, repository structure, and development commands, see [AGENTS.md](./AGENTS.md).

## License

[MIT](./LICENSE)

_This README was generated from the [share-artifact skill](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/SKILL.md) and [README template](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/readme/template.md)._
