# username/project

A simple Go library project.

## Start a project

1. Create a repository with GitHub's **Use this template** button.
2. Replace `github.com/username/project` in `go.mod` with the new module path.
3. Replace the `project` package name and update this README.

## Usage

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

## Development

Enter the Nix development shell and run the standard Go checks:

```bash
nix develop
just check
just build
just test
```

## License

[MIT](./LICENSE)
