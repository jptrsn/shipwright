# Test-Driven Development Process

> For the broader development workflow (branching, task tracking, code review), see `CONTRIBUTING.md`.

**Last Updated:** [DATE]

---

## 1. Core Principle

**No code ships without tests. No tests are written without a user story.**

```
User Story → Acceptance Criteria → Tests → Implementation → Tests Pass → PR
```

---

## 2. The Cycle

### Step 1: Define the Story

Write a user story using `docs/STORY_TEMPLATE.md`. The story must include acceptance criteria (AC-1, AC-2, etc.) and a test coverage mapping that links each AC to a specific test file.

### Step 2: Write Failing Tests

Write tests that cover every acceptance criterion. Run them. Confirm they fail. Commit:

```
add failing tests for US-XXX
```

### Step 3: Implement

Write the minimum code to make all tests pass. Don't add features beyond the acceptance criteria. Don't optimize prematurely.

### Step 4: Refactor

With passing tests as a safety net, refactor for clarity and consistency. Run tests after every change.

### Step 5: PR

Open a PR with: story reference, test files, implementation, updated story status. CI must pass.

---

## 3. Agent Instructions

### Building a Feature

1. Confirm a user story exists and is Ready. If not, create one with the human.
2. Write tests first, referencing acceptance criteria in test descriptions.
3. Implement the feature.
4. Run tests. Fix failures.
5. Reference the story ID in commits and PR description.

### Fixing a Bug

1. Write a test that reproduces the bug (should fail).
2. Fix the bug.
3. Confirm the new test passes and no existing tests regress.

### Reviewing Code

Check that:
- Every new behavior has a test
- Tests are meaningful, not trivially passing
- Test descriptions reference acceptance criteria
- No implementation without tests

### Test Quality Rules

- **Independent.** No test depends on another test's side effects.
- **Deterministic.** No randomness, no timing, no network calls in unit tests.
- **Readable.** Format: `"AC-N: [what it tests]"` — e.g., `"AC-3: rejects input exceeding size limit"`
- **Focused.** Each test file starts with a comment referencing the story: `// Tests for US-003: Feature Name`
- **Mock external dependencies** in unit tests. Only integration tests touch real infrastructure.

---

## 4. Story Organization

```
stories/
  phase-1/
    US-001-feature-name.md
    US-002-another-feature.md
  phase-2/
    US-100-later-feature.md
```

Story IDs are globally unique. Phase 1 starts at US-001, Phase 2 at US-100, Phase 3 at US-200. This allows inserting stories within a phase without renumbering.

---

## 5. Acceptance Criteria Guidelines

Good criteria are **testable, specific, outcome-focused, and edge-case aware.**

Bad:
```
- [ ] Feature works correctly
```

Good:
```
- [ ] AC-1: POST /users returns 201 with user ID in response body
- [ ] AC-2: POST /users with duplicate email returns 409 with error message
- [ ] AC-3: POST /users with missing required fields returns 400 with field-level errors
```

---

## 6. Cross-Component Stories

Stories spanning multiple components should:
- Label acceptance criteria by component
- Map tests to each component separately
- Include integration-level criteria that test the components together

---

## 7. When to Skip TDD

- **Exploratory prototypes:** No tests needed, but code must gain tests before merging to develop
- **Pure UI layout:** No unit tests for visual-only changes (functional UI behavior still needs tests)
- **Config file changes:** Validated by the build
- **Documentation changes:** No tests needed

When in doubt, write the tests.

---

## 8. Test Naming Conventions

| Language | File naming | Test description |
|---|---|---|
| Python | `test_[module].py` | `def test_[behavior]` or `"AC-N: [behavior]"` |
| JavaScript/TypeScript | `[module].test.ts` | `it('AC-N: [behavior]')` |
| Dart | `[module]_test.dart` | `test('AC-N: [behavior]')` |
| C | `test_[module].c` | `test_[module]_[behavior]` |
| Rust | `[module]_test.rs` | `#[test] fn [behavior]` |
| Go | `[module]_test.go` | `func Test[Behavior]` |

---

*This is the authoritative TDD process for this project.*
