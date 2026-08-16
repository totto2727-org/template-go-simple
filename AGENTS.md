# template-go-simple

## Repository structure

```text
.github/workflows/          Validation and optional publishing workflows
AGENTS_TEMPLATE.md          AI and developer guidance for initialized projects
CLAUDE.md                   Relative alias to AGENTS.md
README_TEMPLATE.md          End-user documentation for initialized projects
Justfile                    Go development tasks
flake.nix                   Development shell, package outputs, and overlay
go.mod                      Template module identity and Go version
main.go                     Dependency-free sample CLI
main_test.go                End-to-end CLI behavior test
package.nix                 Installable Nix package
```

## Development commands

### Execution rules

- Run commands from the repository root.
- Enter the environment with `nix develop` before running project tasks.
- Use Just recipes for Go formatting, linting, build, test, and source execution.
- Run Nix package commands directly; never add them to Just or to the `just ci` dependency graph.
- Keep `README_TEMPLATE.md` and `AGENTS_TEMPLATE.md` ready to become the initialized project's canonical documents.

### Standard tasks

- `nix develop` — Enter the pinned Go development environment.
- `just fix` — Format Go source and apply supported golangci-lint fixes.
- `just check` — Verify formatting and lint findings.
- `just build` — Build the Go command.
- `just test` — Run Go tests with the race detector.
- `just run` — Run the command from source.
- `just ci` — Run Go check, build, and test tasks without Nix package validation.
- `nix build .#project` — Build the optional Nix package independently of Just and CI.
- `nix run .` — Run the optional Nix package independently of Just and CI.

## Architecture

### CLI sample

- `main.go` prints a fixed greeting using only the Go standard library.
- `main_test.go` verifies the command's externally observable output.
- Replace both files with the initialized project's command behavior and focused tests.

### Nix packaging

- `package.nix` defines the installable command and its `mainProgram`.
- `flake.nix` exposes the named and default packages, the reusable overlay, and the development shell.
- Nix package validation is intentionally separate from the Just task graph and CI workflow.

### Artifact roles

- `README.md` is the template user's end-user document and contains no detailed initialization workflow.
- This `AGENTS.md` is the canonical AI-agent source for template initialization and maintenance.
- `README_TEMPLATE.md` and `AGENTS_TEMPLATE.md` become the initialized project's canonical documents.
- All four documents follow the matching share-artifact specification and retain their provenance footers.
- `CLAUDE.md` is a relative symlink to the canonical `AGENTS.md`.

## Development tools

- **Go**: Builds, tests, and runs the command-line application.
- **golangci-lint**: Formats and checks Go source.
- **Just**: Defines the Go development task surface.
- **Nix flakes**: Pin the development toolchain and optionally build and expose the package and overlay.
- **share-artifact**: Defines the README and AGENTS audience, structure, and provenance contracts.

## Package-specific rules

### Template initialization

The human creates a repository with GitHub's **Use this template** button, then delegates the remaining initialization to an AI agent.
The agent must complete this workflow instead of instructing the human to perform the mechanical steps:

1. Determine the intended repository name, Go module path, command name, description, license, public interface, and publishing requirements from the user's request and repository context.
2. Replace `github.com/username/project`, `project`, and template metadata in `go.mod`, `package.nix`, `flake.nix`, source files, tests, and workflows where applicable.
3. Replace the sample CLI and test with the smallest project-specific implementation that satisfies the request.
4. If the project does not need a Nix package or overlay, delete `package.nix` and remove `packages`, `overlays`, and related package wiring from `flake.nix` while retaining the development shell.
5. Render complete project-facing `README_TEMPLATE.md` and `AGENTS_TEMPLATE.md` documents from the current share-artifact specifications.
   Remove all placeholder instructions and choose one complete README API mode.
6. If FlakeHub publishing is required, pin every mutable `uses:` reference in the privileged workflow to an audited full commit SHA before renaming `.github/workflows/flakehub-publish-rolling.yml.disabled`; otherwise delete the disabled workflow.
7. Remove the template-only canonical documents and promote the completed project documents:

```bash
rm README.md AGENTS.md
mv README_TEMPLATE.md README.md
mv AGENTS_TEMPLATE.md AGENTS.md
```

8. Run `just ci`.
   If the Nix package remains, run `nix build .#project` and `nix run .` separately; do not add either command to Just or CI.
9. Confirm that `CLAUDE.md` still resolves to `AGENTS.md`, no template placeholders remain, documentation links resolve, and `git diff --check` passes.

### Maintenance

- Prefer the Go standard library when it fully supports the required behavior.
- Run `go mod tidy` after dependency changes and commit `go.mod` and `go.sum` updates together when present.
- Update `flake.lock` when Nix inputs change.
- Keep privileged publishing workflows disabled until their mutable action references are pinned to audited full commit SHAs.

_This AGENTS.md was generated from the [share-artifact skill](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/SKILL.md) and [AGENTS template](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/agents/template.md)._
