# username/project

Replace this paragraph with the project-specific guidance that AI agents need before modifying the repository.

## Language Rules

- Use English by default for source code, configuration, documentation, and other repository-recorded artifacts.
- Replace or extend these rules when the copied project has additional language requirements.

## Repository Structure

- `go.mod` defines the module path and Go version.
- `main.go` contains the command-line application entry point.
- `main_test.go` covers externally observable command behavior.
- `package.nix` defines the installable Nix package.
- `flake.nix` and `flake.lock` expose the package and overlay while pinning Go, golangci-lint, Just, and other Nix-provided tools.
- `.github/workflows/` contains validation and optional publishing workflows.

## Development Commands

Run commands from the repository root inside the Nix development shell.

### Execution Rules

- Enter the environment with `nix develop` before running project commands.
- Use Just recipes instead of invoking formatting, linting, build, or test commands directly.

### Standard Tasks

```bash
just fix
just check
just build
just test
just run
just run-nix
just ci
```

Targeted build tasks are available as `build-go` and `build-nix`.

## Package Updates

Update `go.mod` and `go.sum` together when dependencies change. Run `nix flake update` when Nix inputs change.

## Go Conventions

- Prefer the standard library when it fully supports the required behavior.
- Keep the command entry point small and move reusable application logic into focused packages only when needed.
- Cover externally observable command behavior with end-to-end tests.

## Architecture and Conventions

Replace this section with the copied project's source layout, public boundaries, naming rules, and other repository-specific constraints.

## Development Tools

- **Go** - builds, tests, and runs the command-line application.
- **golangci-lint** - formats and checks Go source code.
- **Just** - provides the standard development commands.
- **Nix flakes** - build and expose the package and overlay while pinning Go, golangci-lint, Just, and other Nix-provided tools.
