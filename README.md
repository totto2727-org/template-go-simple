# Go Simple CLI Template

A GitHub repository template for starting a small Go command-line application with a dependency-free sample, reproducible Nix tooling, standard Go tasks, and AI-led project initialization.

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
- Reproducible Nix development shell, package, and reusable overlay
- Standard Go formatting, linting, build, test, and run tasks through Just
- AI-agent initialization guidance and project-facing documentation templates
- Optional FlakeHub publishing workflow, disabled by default

## Prerequisites

- **GitHub**: Create a repository from this template.
- **AI coding agent**: Use an agent that reads repository `AGENTS.md` instructions.
- **Nix**: Use the included development environment and optional package.

## Setup

1. Create a repository with GitHub's **Use this template** button.
2. Ask an AI coding agent to initialize the repository by following [the template initialization instructions](./AGENTS.md#template-initialization).

## API

### `project`

Runs the sample command and prints `Hello, world!`.
The command defines no options or arguments, and any supplied arguments are ignored.
It writes exactly `Hello, world!` followed by a newline to standard output, writes nothing to standard error, and exits with status `0`.
The sample defines no application-level failure condition; failures are limited to the Go or Nix launcher being unable to build or start the command.
The AI-led initialization replaces this sample with the copied project's command-line behavior.

```console
$ go run .
Hello, world!
```

## Development

For template initialization, repository structure, and development commands, see [AGENTS.md](./AGENTS.md).

## License

[MIT](./LICENSE)

_This README was generated from the [share-artifact skill](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/SKILL.md) and [README template](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/readme/template.md)._
