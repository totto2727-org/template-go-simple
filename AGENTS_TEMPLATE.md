# username/project

## Repository structure

```text
.github/workflows/  Validation and publishing workflows
Justfile            Standard repository tasks
flake.nix           Reproducible development environment
go.mod              Module identity, Go version, and dependencies
lib.go              Library implementation
lib_test.go         Library tests
```

Replace the sample paths with the copied project's actual source and test layout.

## Development commands

### Execution rules

- Run commands from the repository root.
- Enter the environment with `nix develop` before running project tasks.
- Use Just recipes instead of invoking formatting, linting, build, or test tools directly.

### Standard tasks

- `nix develop` — Enter the pinned development environment.
- `just fix` — Format source and apply supported lint fixes.
- `just check` — Verify formatting and lint findings.
- `just build` — Build every Go package.
- `just test` — Run every Go test with the race detector.
- `just ci` — Run the complete local validation gate.

## Architecture

### Package boundaries

- Replace this item with the copied project's package ownership and dependency direction.
- Keep externally supplied values at package boundaries and propagate errors to the owning application boundary.

### Public API

- Keep exported declarations documented with caller-visible behavior and constraints.
- Choose one complete share-artifact API mode for README: canonical registry link, complete inline coverage, or a substantive guide link.
- Cover externally observable behavior with focused tests.

## Development tools

- **Go**: Builds and tests the project.
- **golangci-lint**: Formats and checks Go source.
- **Just**: Defines the standard development task surface.
- **Nix flakes**: Pin the development toolchain and supporting tools.

## Package-specific rules

- Replace this section with repository-specific invariants and remove placeholder guidance before handoff.
- Keep publishing workflows disabled until every mutable `uses:` reference in each privileged publishing workflow is pinned to an audited full commit SHA.
- Run `go mod tidy` after dependency changes and commit the resulting `go.mod` and `go.sum` updates when present.
- Update `go.mod` when the minimum Go version changes.
- Update `flake.lock` when Nix inputs change.

_This AGENTS.md was generated from the [share-artifact skill](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/SKILL.md) and [AGENTS template](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/agents/template.md)._
