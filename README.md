# Go Simple Library Template

A GitHub repository template for starting a small Go library with reproducible Nix tooling, standard Just tasks, and continuous integration.

## Usage

Create a repository from the template, replace the module placeholders, and use the included `Add` function as the starting public API:

```go
package main

import (
	"fmt"

	"github.com/username/project"
)

func main() {
	fmt.Println(project.Add(2, 3))
}
```

## Key features

- Go 1.25 library layout with a focused unit test
- Reproducible Nix development shell with Go, golangci-lint, and Just
- Standard formatting, linting, build, test, and CI tasks
- Optional FlakeHub publication workflow
- Project documentation templates that follow the share-artifact specification

## Prerequisites

- **GitHub CLI**: Create a repository from this GitHub template.
- **Nix**: Enter the pinned development environment.

## Setup

1. Create and clone a repository from the template.

```bash
gh repo create username/project --template totto2727-org/template-go-simple --public --clone
```

2. Enter the repository.

```bash
cd project
```

3. Enter the development environment.

```bash
nix develop
```

4. Update the module path.

```bash
go mod edit -module github.com/username/project
```

5. Complete the documentation, package, and optional publishing conversion steps in [AGENTS.md](./AGENTS.md), then run `just ci`.

## API

### `Add`

Returns the sum of two integers and provides a minimal public function to replace when starting the copied library.

```go
sum := project.Add(2, 3)
```

## Development

For template conversion, project structure, and development commands, see [AGENTS.md](./AGENTS.md).

## License

[MIT](./LICENSE)

_This README was generated from the [share-artifact skill](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/SKILL.md) and [README template](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/readme/template.md)._
