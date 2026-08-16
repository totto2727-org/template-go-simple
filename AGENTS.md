# template-go-simple

This file describes how AI agents maintain this template and convert a repository created from it into a project repository.

## Documentation Roles

- `README.md` and this `AGENTS.md` explain the template itself and must not remain as the copied project's documentation.
- `README_TEMPLATE.md` and `AGENTS_TEMPLATE.md` are the starting points for the copied project's documentation.

## Converting a Template Copy

After creating a repository with GitHub's **Use this template** button, complete every step below:

1. Replace `project`, `github.com/username/project`, and the repository metadata in `go.mod`, `package.nix`, and `flake.nix`.
2. Update the package description, version, and Nix metadata.
3. If the copied project does not need a Nix package or overlay, delete `package.nix` and remove the `packages`, `overlays`, and related package wiring from `flake.nix`, leaving the development shell in place.
4. Replace the placeholders in `README_TEMPLATE.md` with the copied project's user-facing overview, usage, features, prerequisites, setup, and license details.
5. Replace the placeholders in `AGENTS_TEMPLATE.md` with the copied project's commands, architecture, and conventions.
6. To publish the Nix flake to FlakeHub, rename `.github/workflows/flakehub-publish-rolling.yml.disabled` to `flakehub-publish-rolling.yml`. Delete the disabled file if FlakeHub publishing is not needed.
7. Remove the template-only `README.md` and `AGENTS.md`, then promote the completed template files:

```bash
rm README.md AGENTS.md
mv README_TEMPLATE.md README.md
mv AGENTS_TEMPLATE.md AGENTS.md
```

## Template Development Commands

Enter the Nix development shell and run the standard Just tasks when modifying the template implementation:

```bash
nix develop
just fix
just ci
just run-nix
```
