# Go Simple CLI Template

A GitHub repository template for starting a simple Go command-line application with a Nix development shell, a buildable package and overlay, Just commands, automated checks, and an optional FlakeHub publishing workflow.

## Use This Template

Create a repository with GitHub's **Use this template** button, then follow the conversion workflow in [AGENTS.md](./AGENTS.md). The workflow replaces the template's explanatory documentation with project-specific files based on `README_TEMPLATE.md` and `AGENTS_TEMPLATE.md`.

## Included Tooling

- A Nix development shell with Go, golangci-lint, and Just.
- A buildable Nix package and reusable overlay.
- GitHub Actions checks for formatting, linting, building, and testing.
- An optional FlakeHub publishing workflow, disabled by default.
- A dependency-free Hello World CLI and end-to-end test that can be replaced with project code.

## Documentation Layout

- `README.md` and `AGENTS.md` explain this template and the conversion workflow.
- `README_TEMPLATE.md` and `AGENTS_TEMPLATE.md` are customized and renamed for the copied project.

## Development

For template conversion steps, development commands, and publishing configuration, see [AGENTS.md](./AGENTS.md).

## License

[MIT](./LICENSE)
