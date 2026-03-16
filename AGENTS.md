# [Project Name] — Agent Instructions

<!--
SETUP INSTRUCTIONS (delete this block after customizing):

This is the root agent context file. It is read automatically by Codex CLI, GitHub Copilot,
Cursor, Windsurf, Amp, and Devin. Claude Code reads CLAUDE.md and Gemini CLI reads GEMINI.md —
run setup-agents.sh to create pointer files that direct those tools here.

To customize this file for your project:

1. Replace [Project Name] in the title above.
2. Write 1-3 sentences in the Project section describing what the system does.
3. In the Architecture section, add links to your per-component spec docs in docs/.
4. In Project Structure, replace with your actual directory layout.
5. In Critical Constraints, list non-obvious rules agents would get wrong without being told.
   Focus on what CANNOT be inferred from the code: memory limits, security invariants,
   wire format contracts, intentional design quirks. Don't tell agents to "write clean code" —
   they know that. Tell them "WiFi stack consumes 80KB SRAM, guard all WiFi code with ifdefs."
6. In Code Style, list per-language conventions that are project-specific. Include indent size,
   naming conventions, patterns (e.g., "use repository pattern, not direct DB access"), and
   logging (e.g., "use ESP_LOGI/LOGW/LOGE, tag is the module name").
7. In Boundaries, list the contracts between components that must not change without updating
   multiple documents and codebases simultaneously. These are the things that break silently
   if one side changes without the other.
8. In MVP Scope, define what's in and out for the current development phase. Agents will not
   add features beyond this scope unless explicitly asked.

For a monorepo, also create an AGENTS.md in each component directory:

    # [Component] Agent Instructions

    Read `../AGENTS.md` for project-wide rules. Read `../docs/[COMPONENT].md` for the specification.

    ## Stack
    [framework, language version, key libraries]

    ## Build and Test
    [exact commands — agents use these verbatim]

    ## Critical Patterns
    [component-specific things agents must know]

    ## Do Not
    [component-specific prohibitions]

Then run setup-agents.sh to create CLAUDE.md and GEMINI.md pointer files in each directory.
Edit the DIRS variable in the script to list your component directories first.
-->

## Project

[One to three sentences: what this project does, who it's for, the core technical approach.]

## Architecture

Read these docs before making changes to any component:

- `ARCHITECTURE.md` — System-level design, data model, API contracts, component boundaries
- `CONTRIBUTING.md` — Development workflow: branching, task tracking, code review, integration testing
- `BACKLOG.md` — Prioritized task list (check before starting work)
- `docs/TDD.md` — Test-driven development process (mandatory for all code changes)
- `docs/TEST_SETUP.md` — Test infrastructure: how to write and run tests per component
- `docs/STORY_TEMPLATE.md` — Template for creating user stories

<!-- Add per-component spec docs here. Examples:
- `docs/API.md` — REST API specification
- `docs/FRONTEND.md` — Frontend architecture and component library
- `docs/DATABASE.md` — Database schema and migration strategy
-->

## Project Structure

<!-- Replace with your actual layout -->
```
[project-name]/
  [component-1]/    — [Language/framework, brief purpose]
  [component-2]/    — [Language/framework, brief purpose]
  docs/             — Technical specifications
  stories/          — User stories organized by phase
  test-fixtures/    — Shared test data for cross-component contract tests
```

## Critical Constraints

<!-- List the non-obvious rules that an agent would get wrong without being told.
     Focus on things that CANNOT be inferred from the code. Examples below — replace with yours: -->

- [Memory/performance constraint — e.g., "Max 512KB SRAM, no PSRAM. Script buffer capped at 16KB."]
- [Security invariant — e.g., "No PII stored on the embedded device. WiFi credentials held in RAM only by default."]
- [Protocol contract — e.g., "BLE advertising data is exactly 16 bytes. Do not change without updating ARCHITECTURE.md Section 5.3."]
- [Intentional quirk — e.g., "The device continues executing after BLE disconnect. It does NOT abort."]

## Code Style

<!-- Per-language conventions. Be specific. Examples below — replace with yours: -->

- **[Language 1]:** [indent, naming, patterns, logging conventions]
- **[Language 2]:** [indent, naming, patterns, logging conventions]

## Boundaries — Do Not Modify Without Discussion

<!-- These are the stable contracts between components. Changing any of these requires
     updating multiple documents and components simultaneously. Examples below — replace: -->

- [API endpoint paths and request/response schemas (defined in ARCHITECTURE.md Section X)]
- [Database collection/table names and field names (defined in ARCHITECTURE.md Section Y)]
- [Wire protocol message formats and type values (defined in ARCHITECTURE.md Section Z)]
- [Configuration key names (defined in [COMPONENT].md Section N)]

## MVP Scope

<!-- What's in scope for the current phase. Agents should not add features beyond this
     unless explicitly asked. Link to a roadmap if you have one. -->

[Describe current phase scope. Example: "Phase 1 MVP includes only: REST API, web frontend,
and database migrations. No mobile app, no background workers, no third-party integrations.
See ROADMAP.md for the full plan."]

## Development Process

All code changes follow the process defined in `CONTRIBUTING.md` and `docs/TDD.md`:

1. Every feature starts with a user story (see `docs/STORY_TEMPLATE.md`)
2. Stories must be approved by a human (status: Ready) before an agent begins work
3. Tests are written before implementation
4. PRs must reference a user story and include tests
5. Check `BACKLOG.md` before starting work to avoid conflicts with other agents
6. PRs are reviewed and merged by a human

Do not submit code without corresponding tests. Do not start work on a Draft story — only Ready or beyond.
