# Agentic Development Template

A project template for developing software collaboratively with AI coding agents (Claude Code, Codex, Gemini CLI, Cursor, etc.) using a spec-first, test-driven approach.

## What This Is

This template provides the process, structure, and documentation scaffolding for projects where humans and AI agents collaborate on code. It defines:

- **How features are specified** before any code is written
- **How agents discover what to work on** and operate autonomously within defined boundaries
- **How quality is maintained** through test-driven development and structured code review
- **How humans stay in control** with two explicit gates in the workflow

## Philosophy

1. **Spec before code.** Write architecture docs and feature specs before implementation. Agents produce better code when they have authoritative reference material, not just a prompt.
2. **Stories before tests. Tests before code.** Every feature starts as a user story with testable acceptance criteria. Tests are written first. Implementation makes the tests pass.
3. **Agents are autonomous between human gates.** Agents can pick up work, write tests, implement features, and open PRs without waiting for humans — but humans approve stories before work begins and review PRs before they merge.
4. **One source of truth per concern.** Architecture in ARCHITECTURE.md. Task priority in BACKLOG.md. Story status in the story file. Agent context in AGENTS.md. No duplicate sources that can drift.

## Template Contents

```
├── AGENTS.md                      # Root agent context (customize per project)
├── ARCHITECTURE.md                # System architecture template
├── BACKLOG.md                     # Prioritized task list
├── CONTRIBUTING.md                # Development workflow guide
├── .github/
│   └── pull_request_template.md   # PR checklist
├── docs/
│   ├── TDD.md                     # Test-driven development process
│   ├── TEST_SETUP.md              # Test infrastructure per component (customize)
│   └── STORY_TEMPLATE.md          # User story template
├── stories/                       # User stories organized by phase
│   └── README.md
├── test-fixtures/                 # Shared test data for cross-component contracts
│   └── README.md
├── setup-agents.sh                # Creates CLAUDE.md and GEMINI.md pointer files
└── .gitignore                     # Common patterns (customize)
```

## Getting Started

### Step 1: Set Up the Repo

**New project:** Use this as a GitHub template repo, or clone and remove the git history:
```bash
git clone https://github.com/jptrsn/agentic-dev-template.git my-project
cd my-project
rm -rf .git
git init
git add -A && git commit -m "initialize from agentic dev template"
```

**Existing project:** Add as a reference and copy the files you need:
```bash
git clone https://github.com/jptrsn/agentic-dev-template.git /tmp/template
cp -r /tmp/template/{AGENTS.md,ARCHITECTURE.md,BACKLOG.md,CONTRIBUTING.md,.github,docs,stories,test-fixtures,setup-agents.sh} /path/to/your/repo/
```

### Step 2: Define Your Architecture

Open `ARCHITECTURE.md` and replace all placeholder text with your system's design. Focus on:

- What the system does and who it's for (Section 1)
- Component list with technologies and responsibilities (Section 2.1)
- How components communicate — protocols, direction, purpose (Section 2.2)
- Data model — the authoritative field definitions that all components reference (Section 3)
- API contracts — the interfaces between components that must not change without updating all consumers (Section 4)

This is the single most important document in the repo. Agents read it before every task. The more precise it is, the better the code agents produce.

If your project has multiple major components, create per-component spec docs in `docs/` for implementation details that don't belong in the architecture doc:

```
docs/
  API.md          # REST endpoints, request/response examples, auth
  FRONTEND.md     # Component library, state management, routing
  MOBILE.md       # Platform-specific concerns, BLE, push notifications
  DATABASE.md     # Schema, migrations, indexing strategy
```

### Step 3: Customize Agent Context

Open `AGENTS.md` and fill in:

- **Project description** — one to three sentences
- **Spec doc links** — add your per-component docs to the Architecture section
- **Project structure** — your actual directory layout
- **Critical constraints** — things an agent would get wrong without being told (memory limits, security invariants, protocol contracts, intentional quirks)
- **Code style** — per-language conventions that are project-specific
- **Boundaries** — contracts between components that must not change without updating multiple docs
- **MVP scope** — what's in and out of scope for the current phase

For a monorepo, also create an `AGENTS.md` in each component directory that points to the root and to that component's spec doc. Then run `setup-agents.sh` to create CLAUDE.md and GEMINI.md pointer files — edit the `DIRS` variable in the script first to list your component directories.

### Step 4: Set Up Test Infrastructure

Open `docs/TEST_SETUP.md` and replace the placeholder content with your actual test frameworks, directory structures, and run commands. The template includes quick-reference examples for common stacks (Python, JS/TS, Dart, C, Rust, Go).

### Step 5: Write Your First User Stories

Copy `docs/STORY_TEMPLATE.md` to `stories/phase-1/US-001-your-feature.md` and fill it in. A good first set of stories covers foundational contracts (data models, API shapes, wire protocols) that other features depend on.

### Step 6: Prioritize the Backlog

Open `BACKLOG.md` and add your stories in priority order. Stories with no dependencies go first.

### Step 7: Start Working

Point your AI coding agent at the repo. It reads `AGENTS.md` for context, checks `BACKLOG.md` for what to do, reads the story, writes failing tests, implements, and opens a PR. You review stories before work starts and PRs before they merge.

## How the Process Works

```
Human writes story → Human approves (Ready) → Agent writes failing tests →
Agent implements → Agent opens PR → Human reviews and merges
```

See `CONTRIBUTING.md` for the complete workflow including gitflow branching, code review requirements, integration testing strategy, and agent autonomy boundaries.

## Adapting This Template

### Monorepo vs Single Component

For a monorepo, create per-component AGENTS.md files and spec docs. For a single-component project, the root AGENTS.md and a single spec doc are sufficient.

### Agent Tool Compatibility

AGENTS.md is read natively by Codex CLI, GitHub Copilot, Cursor, Windsurf, Amp, and Devin. Claude Code reads CLAUDE.md and Gemini CLI reads GEMINI.md — `setup-agents.sh` creates pointer files so all tools read the same content.

### Scaling

Works for solo developers with one agent, small teams with multiple agents, and larger teams where different people own different components. BACKLOG.md prevents agents from colliding. Story files track status. The PR template enforces consistency.

## License

This template is released under the MIT License. Use it however you want.
