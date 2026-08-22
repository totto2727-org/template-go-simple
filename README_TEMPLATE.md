# username/project

Replace this paragraph with a concise description of what the command-line application does, who it serves, and why someone would use it.

## Usage

Prefer a direct `go run` example with no application options and representative output.

```console
$ go run github.com/username/project@latest
Hello, world!
```

## Key features

- Replace this item with a user-visible capability.
- Replace this item with another user-visible capability.

## Prerequisites

- **Go or Nix**: Replace this text with the minimum Go requirement, or require Nix with flakes enabled for the Nix paths.

## Setup

Choose one of the following setup methods. Only one is required.

### Run without installing

Run with either Go:

```bash
go run github.com/username/project@latest
```

or Nix:

```bash
nix run github:username/project
```

### Install the command

Install with either Go:

```bash
go install github.com/username/project@latest
```

or Nix:

```bash
nix profile install github:username/project
```

### Add declaratively with Nix

Add the project's overlay and package to `flake.nix`.

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    project.url = "github:username/project";
  };

  outputs = { nixpkgs, project, ... }:
    let
      system = "aarch64-darwin"; # Replace with a supported host system.
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ project.overlays.default ];
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = [ pkgs.project ];
      };
    };
}
```

## API

### `project`

Replace this text with the command's caller-visible behavior, inputs, outputs, exit statuses, and failure contract.
If a complete inline reference would be too large, replace this section with a link to a substantive guide under `docs/`.

```console
$ project
replace-with-representative-output
```

## Development

For repository structure and development commands, see [AGENTS.md](./AGENTS.md).

## License

[MIT](./LICENSE)

_This README was generated from the [share-artifact skill](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/SKILL.md) and [README template](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/readme/template.md)._
