# Contributing Guide

> How we work. For humans and AI agents alike.

**Last Updated:** [DATE]

---

## 1. Development Flow

Every piece of work follows this path:

```
Idea → Story (Draft) → Story (Ready) → Tests Written → Implemented → PR Open → Merged
```

| Transition | Who | What happens |
|---|---|---|
| Idea → Draft | Human + Agent | Collaboratively write the story using `docs/STORY_TEMPLATE.md` |
| Draft → Ready | **Human only** | Human reviews and approves the story |
| Ready → Tests Written | Agent (autonomous) | Agent writes failing tests, commits, updates story status |
| Tests Written → Implemented | Agent (autonomous) | Agent writes code until tests pass |
| Implemented → PR Open | Agent (autonomous) | Agent opens PR using the PR template |
| PR Open → Merged | **Human only** | Human reviews and merges |

**Agents operate autonomously between the two human gates.** Once a story is Ready, an agent can take it to a PR without waiting — unless it encounters a decision that changes the acceptance criteria or a boundary defined in `AGENTS.md`.

---

## 2. Branching Strategy (Gitflow)

| Branch | Purpose | Created from | Merges into |
|---|---|---|---|
| `main` | Stable, production-ready code. Protected. | — | — |
| `develop` | Integration branch. All feature work merges here. | `main` | `main` (via release) |
| `feature/US-XXX-short-name` | One story's work. | `develop` | `develop` |
| `release/vX.Y.Z` | Release stabilization. | `develop` | `main` + `develop` |
| `hotfix/description` | Emergency production fix. | `main` | `main` + `develop` |

**Rules:**
- Every story gets its own feature branch
- PRs target `develop`, not `main`
- No direct commits to `main` or `develop`
- Squash merge is fine — commit messages on feature branches don't need polish
- Delete feature branches after merge

**Agent instructions:**
```bash
git checkout develop
git pull origin develop
git checkout -b feature/US-XXX-short-name
# ... work ...
# Open PR targeting develop
```

---

## 3. Task Tracking (BACKLOG.md)

`BACKLOG.md` at the repo root is the prioritized task list. Both humans and agents read it.

- **Humans** reorder the Ready list to set priorities
- **Agents** pick the top Ready item not already In Progress, claim it, and start working
- An agent must check BACKLOG.md before starting to avoid conflicts with other agents

**Dependency rule:** A story can be started if all its dependencies are **fully defined** (status Ready or beyond). Dependencies do NOT need to be implemented — mock their interfaces based on their defined acceptance criteria.

---

## 4. Story Lifecycle

### Status Tracking

The status line in each story file is the authoritative status:

```markdown
**Status:** [ ] Draft → [x] Ready → [ ] In Progress → [ ] Tests Written → [ ] Implemented → [ ] Merged
```

Agents update the story file status on their feature branch as they progress.

### When Agents Should Stop and Ask

- An acceptance criterion contradicts a spec doc or seems untestable
- Implementation requires changing a contract defined in "Boundaries" in AGENTS.md
- A dependency story's interface is unclear or undefined
- The story scope is too large for a single PR (suggest splitting)
- A technical decision with multiple valid approaches needs human input

### When Agents Should NOT Stop

- Choosing between implementation approaches that don't affect external contracts
- Adding internal helper functions or utilities
- Refactoring existing code (as long as existing tests pass)
- Fixing minor test failures they understand

---

## 5. Code Review

### Automated Checks (CI + Agent Review)

- [ ] All tests pass
- [ ] No existing tests broken
- [ ] Code compiles/builds without warnings
- [ ] Lint passes
- [ ] Code patterns consistent with the rest of the codebase
- [ ] No secrets, credentials, or PII in the code
- [ ] No out-of-scope features

### Human Review Focus

- **Story alignment:** Does the implementation satisfy the acceptance criteria as a user would understand them?
- **Test quality:** Are tests meaningful? Do they cover edge cases? Would they catch real regressions?
- **Spec compliance:** Do data formats, API responses, and state transitions match the spec docs?
- **Naming and clarity:** Will another developer understand this in 3 months?
- **Missing cases:** Error paths, boundary conditions, empty input, disconnection, timeout

---

## 6. Commit Messages

Keep it simple. No enforced format. Just make it clear what changed:

```
add failing tests for US-003
implement user authentication flow
fix off-by-one in pagination logic
```

Squash merging means feature branch history doesn't matter — the PR title and description (from the template) are what matter.

---

## 7. Integration Testing Strategy

### Tier 1: Contract Tests (Automated, No External Dependencies)

Verify that one component's output matches what another component expects. Use shared fixture files in `test-fixtures/` that both components' test suites reference.

If component A produces a binary payload and component B parses it, both test suites load the same fixture file and verify their encoder/decoder handles it correctly. If either side changes the format, the other side's tests break immediately.

### Tier 2: Simulated End-to-End (Automated)

Chain the full pipeline in a single test: input → processing → output, with external services mocked. Runs on the dev machine with no infrastructure needed.

### Tier 3: Smoke Test (Manual, Pre-Release)

A documented checklist in `docs/RELEASE_CHECKLIST.md` that a human runs with real infrastructure before any release.

### Tier 4: Full Integration CI (When Justified)

Automated tests against real infrastructure (staging environment, test databases, hardware). Invest in this when the project is stable enough to justify the setup cost.

---

*This document is the authoritative guide for how development proceeds. Read it before starting work.*
