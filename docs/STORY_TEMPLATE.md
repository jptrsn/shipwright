# Story Template

> Copy this file to create a new user story. Replace all placeholder text. Delete this block.

---

# US-XXX: [Title — short, action-oriented]

**Phase:** [1 / 2 / 3 / ...]
**Components:** [list all involved components]
**Priority:** [P0 critical / P1 high / P2 medium / P3 low]
**Status:** [ ] Draft → [ ] Ready → [ ] In Progress → [ ] Tests Written → [ ] Implemented → [ ] Merged

---

## User Story

**As a** [type of user],
**I want to** [action or capability],
**So that** [benefit or outcome].

## Context

[Why this story exists. What problem it solves. Dependencies on other stories. Links to relevant spec sections.]

## Acceptance Criteria

- [ ] **AC-1:** [Specific, testable outcome]
- [ ] **AC-2:** [Specific, testable outcome]
- [ ] **AC-3:** [Error case or edge case]
- [ ] **AC-4:** [Boundary condition]

## Test Coverage

| AC | Test File | Test Type | Description |
|---|---|---|---|
| AC-1 | `[component]/test/...` | Unit | [What the test verifies] |
| AC-2 | `[component]/test/...` | Unit | [What the test verifies] |
| AC-3 | `[component]/test/...` | Unit | [What the test verifies] |
| AC-4 | `[component]/test/...` | Integration | [What the test verifies] |

Test types: Unit, Widget, Integration, Contract, Manual

## Dependencies

- [US-XXX: Story this depends on] (must be defined, not necessarily implemented)
- [Technical prerequisite]

## Notes

[Design decisions, open questions, implementation hints. Delete if empty.]

---

## Checklist (for PR)

- [ ] All acceptance criteria have corresponding tests
- [ ] All tests pass
- [ ] No unrelated changes included
- [ ] Story status updated
- [ ] Spec docs updated if behavior changed
