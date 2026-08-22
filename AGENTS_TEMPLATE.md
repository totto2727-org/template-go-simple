# username/project

## Repository structure

```text
.github/workflows/  Validation and optional publishing workflows
Justfile            Go development tasks
flake.nix           Development shell and optional package outputs
go.mod              Module identity, Go version, and dependencies
main.go             Command-line application entry point
main_test.go        End-to-end command behavior tests
package.nix         Optional installable Nix package
```

Replace the sample paths with the initialized project's actual source and test layout.

## Development commands

### Execution rules

- Run commands from the repository root.
- Enter the environment with `nix develop` before running project tasks.
- Use Just recipes for Go formatting, linting, build, test, and source execution.
- Run Nix package commands directly; never add them to Just or to the `just ci` dependency graph.

### Standard tasks

- `nix develop` — Enter the pinned development environment.
- `just fix` — Format Go source and apply supported lint fixes.
- `just check` — Verify formatting and lint findings.
- `just build` — Build the Go command.
- `just test` — Run Go tests with the race detector.
- `just run` — Run the command from source.
- `just ci` — Run Go check, build, and test tasks without Nix package validation.
- `nix build .#project` — Build the optional Nix package independently.
- `nix run .` — Run the optional Nix package independently.

## Architecture

### CLI boundaries

- Keep the command entry point small and move reusable application logic into focused packages only when needed.
- Propagate errors to the command boundary and define caller-visible output and exit-status behavior.
- Cover externally observable command behavior with focused tests.

### Nix packaging

- Keep `package.nix`, package outputs, and the overlay only when consumers need an installable Nix package.
- Keep Nix package validation separate from Just and CI.

## Development tools

- **Go**: Builds, tests, and runs the command-line application.
- **golangci-lint**: Formats and checks Go source.
- **Just**: Defines the Go development task surface.
- **Nix flakes**: Pin the development toolchain and optionally build and expose the package and overlay.

## Package-specific rules

- Replace this section with repository-specific invariants and remove placeholder guidance before handoff.
- Keep README Usage centered on `go run module/path@latest` with no application options when possible.
- Keep README Setup complete: direct `go run` and `nix run`, installed `go install` and `nix profile install`, and a declarative `flake.nix` example using `overlays.default`.
- Prefer the Go standard library when it fully supports the required behavior.
- Run `go mod tidy` after dependency changes and commit `go.mod` and `go.sum` updates together when present.
- Update `flake.lock` when Nix inputs change.
- Keep privileged publishing workflows disabled until every mutable `uses:` reference is pinned to an audited full commit SHA.

_This AGENTS.md was generated from the [share-artifact skill](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/SKILL.md) and [AGENTS template](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/agents/template.md)._
