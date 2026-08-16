# template-go-simple

## Repository structure

```text
.github/workflows/          Validation and optional publishing workflows
AGENTS_TEMPLATE.md          AI and developer guidance for copied projects
README_TEMPLATE.md          End-user documentation for copied projects
Justfile                    Standard repository tasks
flake.nix                   Reproducible Go development environment
go.mod                      Template module identity and Go version
lib.go                      Sample public library implementation
lib_test.go                 Sample unit test
```

## Development commands

### Execution rules

- Run commands from the repository root.
- Enter the environment with `nix develop` before running project tasks.
- Use Just recipes instead of invoking formatting, linting, build, or test tools directly.
- Keep `README_TEMPLATE.md` and `AGENTS_TEMPLATE.md` ready to become the copied project's canonical documents.

### Standard tasks

- `nix develop` — Enter the pinned Go development environment.
- `just fix` — Format Go source and apply supported golangci-lint fixes.
- `just check` — Verify formatting and lint findings.
- `just build` — Build every Go package.
- `just test` — Run every Go test with the race detector.
- `just ci` — Run check, build, and test tasks.

## Architecture

### Template documentation

- `README.md` and this `AGENTS.md` describe how to use and maintain the template repository.
- `README_TEMPLATE.md` and `AGENTS_TEMPLATE.md` become the copied project's documentation after their placeholders are replaced.
- All four documents follow the share-artifact README or AGENTS specification and retain their provenance footers.

### Library sample

- `lib.go` demonstrates one documented exported function without imposing an application architecture on copied repositories.
- `lib_test.go` demonstrates an externally observable unit test and can be replaced with project-specific tests.

### Automation

- The CI workflow runs `just ci` in the Nix environment.
- The FlakeHub workflow remains disabled until a copied project explicitly enables publication.

## Development tools

- **Go**: Builds and tests the sample library.
- **golangci-lint**: Formats and checks Go source.
- **Just**: Defines the standard development task surface.
- **Nix flakes**: Pin the Go toolchain and supporting tools.

## Package-specific rules

- Replace `github.com/username/project`, the package name, README content, and AGENTS guidance when converting a copied repository.
- Customize `README_TEMPLATE.md` and `AGENTS_TEMPLATE.md`, select a complete API documentation mode, then replace the template-only canonical documents:

```bash
rm README.md AGENTS.md
mv README_TEMPLATE.md README.md
mv AGENTS_TEMPLATE.md AGENTS.md
```

- Keep the FlakeHub workflow disabled until every mutable `uses:` reference in the privileged publishing workflow is pinned to an audited full commit SHA. After pinning, rename the file to `flakehub-publish-rolling.yml` and run `just ci`; delete the disabled file when publication is not required.
- Run `go mod tidy` after dependency changes and commit the resulting `go.mod` and `go.sum` updates when present.
- Update `flake.lock` when Nix inputs change, then run `just ci` in the converted repository.

_This AGENTS.md was generated from the [share-artifact skill](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/SKILL.md) and [AGENTS template](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/agents/template.md)._
