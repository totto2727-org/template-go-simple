# template-go-simple initialization

## Template files

| File | Meaning |
| --- | --- |
| `README.md` | Template entry point: asks an AI agent to follow this initialization guide. |
| `AGENTS.md` | Template file map and initialization instructions. Replaced after initialization. |
| `README_TEMPLATE.md` | End-user README skeleton to customize and promote to README.md. |
| `AGENTS_TEMPLATE.md` | Copied-project development guidance to customize and promote to AGENTS.md. |
| `main.go`, `main_test.go` | Starter command and behavior test to replace with the new project. |
| `go.mod` | Go module identity, minimum Go version, and dependencies. |
| `Justfile` | Go formatting, linting, build, test, and source-run tasks, including the output command name. |
| `.golangci.yml` | Go formatting and lint policy. |
| `flake.nix` | Nix development environment, package outputs, and reusable overlay. |
| `flake.lock` | Pinned Nix inputs. |
| `package.nix` | Nix CLI package identity, version, dependency hash, license, and main program. |
| `.envrc` | Optional direnv entry point for the Nix shell. |
| `.github/workflows/ci.yml` | Pre-merge Go validation using the Nix development environment. Does not build the Nix package. |
| `.github/workflows/flakehub-publish-rolling.yml.disabled` | Disabled public rolling FlakeHub publication workflow. |
| `.gitignore` | Local outputs and temporary files excluded from Git. |
| `LICENSE` | License and copyright holder to review for the new project. |

## Initialization

### 1. Establish the project

Use the requested repository name, Go module path, command name, purpose, license, public interface, and publication targets.
Resolve missing project-specific decisions with the user rather than inventing repository ownership or publishing credentials.
Work from the copied repository root and enter `nix develop` before running project tasks.
If using direnv, review `.envrc` before explicitly running `direnv allow`.

### 2. Replace metadata and starter files

Replace `github.com/username/project` in `go.mod` with the intended module path and update imports where applicable.
Replace `project` in the `Justfile` build output, `package.nix`, the package/overlay attributes in `flake.nix`, and documentation with the intended command name.
Update the flake description, package version and metadata, repository references, and license holder.
Replace the starter command and test with the smallest implementation and focused tests that satisfy the request.
Prefer the Go standard library when it fully supports the required behavior.

Keep Nix package/overlay outputs for a distributable CLI.
If the project is no longer distributed as a CLI, remove `package.nix` and its package/overlay wiring while retaining the development shell, and remove the corresponding README installation paths.
When dependencies change, run `go mod tidy` in the development environment, retain `go.mod` and `go.sum` updates together when present, and update `package.nix` dependency vendoring metadata as needed.
Update `flake.lock` when Nix inputs change.

Keep shared `totto2727-org/monorepo` action references on `@main`, matching the other simple templates.
Do not create `CLAUDE.md`.

### 3. Create the project's documentation

Customize `README_TEMPLATE.md` for the actual user-facing features, usage, prerequisites, supported installation methods, and public API.
Keep the supported Go/Nix execution, installation, and declarative overlay setup paths as alternatives, stating that only one setup method is required.
Customize `AGENTS_TEMPLATE.md` for the actual file layout, development commands, boundaries, and project-specific rules.
Use the [share-artifact README specification](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/readme/spec.md) and [AGENTS specification](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/agents/spec.md) for these copied-project documents and retain their provenance footers.
Remove placeholder guidance, unsupported setup methods, and template initialization instructions, and choose one complete README API mode.
The template's root documents intentionally serve only as an entry point and initialization guide, rather than adopting the copied project's README/AGENTS structure.

Complete the publication decisions below before replacing this guide, then promote the customized documents:

```bash
rm README.md AGENTS.md
mv README_TEMPLATE.md README.md
mv AGENTS_TEMPLATE.md AGENTS.md
```

### 4. Configure optional publication

Configure or delete the disabled FlakeHub workflow using the instructions below before replacing this guide.
Go module releases and FlakeHub publication are independent choices.
Do not publish releases or enable publishing workflows until the user has authorized publication and the required repository settings are configured.

### 5. Validate and hand off

Run `just ci` inside `nix develop` to check formatting and lint, build the command, and run the tests with the race detector.
Use Just recipes for Go formatting, linting, build, test, and source execution.
Nix package builds are not part of normal CI or required initialization validation, and must not be added to the Just CI task graph.
Review the final documents for remaining placeholders, obsolete template file references, and valid links, then run `git diff --check` and commit the initialized project.

## Publication setup

### Go module releases

- For public distribution, verify that the copied GitHub repository is publicly accessible and that `go.mod` uses its exact module path.
- This template has no Go registry publishing workflow or registry token requirement. Go tools resolve released versions from version-control tags.
- After validation and explicit release approval, commit the initialized module and push a new semantic version tag such as `v0.1.0`. Protect release tags and never move or rewrite a published version.
- If the project uses a `v2` or later module, follow Go's major-version module-path rules and update documentation/import paths consistently.
- Verify the documented `go run module/path@version` and `go install module/path@version` paths against the released command. Do not claim public installation is available for an unreleased or private repository.

Reference: [Go module publishing](https://go.dev/doc/modules/publishing).

### FlakeHub rolling publication

- Keep `.github/workflows/flakehub-publish-rolling.yml.disabled` disabled until a copied project explicitly enables publication. Delete it if FlakeHub publication is not needed.
- Use the [official FlakeHub publishing wizard](https://flakehub.com/new) to verify the repository name, intended public visibility, and trusted GitHub organization binding.
- The shared publishing action derives the flake name from `github.repository` and publishes a public rolling release. Confirm that this visibility and naming match the user's intent.
- Before enabling publication, pin third-party action references such as `actions/checkout@v7` to audited full commit SHAs. Keep shared `totto2727-org/monorepo` action references on `@main` and review their current implementation, including nested third-party pins.
- Protect `main`, confirm GitHub Actions is allowed to run the referenced actions, and retain the job-scoped `id-token: write` and `contents: read` permissions for OIDC publication. Do not add a long-lived publishing token.
- Only after these settings are confirmed, rename the disabled file to `flakehub-publish-rolling.yml`. It publishes pushes to `main`, independently of Go release tags.

Reference: [FlakeHub publishing and trusted-platform model](https://docs.determinate.systems/flakehub/publishing/).
