# Test Infrastructure Setup

> How to set up, write, and run tests for each component. Customize this for your project's tech stack.

**Last Updated:** [DATE]

---

## 1. Overview

Every component has its own test framework, directory, and CI integration. Tests run locally during development and automatically on every PR.

<!-- Replace this table with your actual components -->

| Component | Framework | Test Location | Run Command |
|---|---|---|---|
| [Component 1] | [Framework] | `[component]/test/` | `[command]` |
| [Component 2] | [Framework] | `[component]/test/` | `[command]` |

---

## 2. Common Stacks — Quick Reference

### Python (pytest)

```bash
# Install
pip install pytest pytest-cov

# Run
pytest
pytest --cov=src
pytest tests/test_specific.py -v
```

Test structure:
```
src/
tests/
  test_[module].py
  conftest.py          # Shared fixtures
```

### JavaScript / TypeScript (Jest)

```bash
# Install
npm install --save-dev jest ts-jest @types/jest

# Run
npx jest
npx jest --coverage
npx jest tests/specific.test.ts
```

### JavaScript (Node.js built-in — zero dependency)

```bash
# No install needed (Node 20+)
node --test
node --test test/specific.test.js
```

### Dart / Flutter

```bash
# Run
flutter test
flutter test test/specific_test.dart
flutter test --coverage
```

### C (Unity)

```c
// test_example.c
#include "unity.h"
void test_something(void) { TEST_ASSERT_EQUAL(42, my_function()); }
void app_main(void) { UNITY_BEGIN(); RUN_TEST(test_something); UNITY_END(); }
```

```bash
gcc -I/path/to/unity test_example.c module.c unity.c -o test && ./test
```

### Rust

```bash
cargo test
cargo test specific_test_name
cargo test -- --nocapture  # Show println output
```

### Go

```bash
go test ./...
go test -v ./pkg/specific/
go test -cover ./...
```

---

## 3. Writing Tests — Universal Patterns

### Reference the Story

Every test file should identify which story it covers:

```python
# Tests for US-003: User Authentication
```
```javascript
// Tests for US-003: User Authentication
```
```dart
// Tests for US-003: User Authentication
```

### Reference Acceptance Criteria

Test names should include the AC number:

```python
def test_ac1_valid_credentials_return_token():
```
```javascript
test('AC-1: valid credentials return auth token', () => {
```
```dart
test('AC-1: valid credentials return auth token', () {
```

### Structure

```
Arrange → Act → Assert
```

One behavior per test. If a test needs a long description to explain what it does, it's testing too much.

### Mocking

Mock external dependencies in unit tests. Only integration tests touch real infrastructure. Common things to mock: databases, HTTP clients, file systems, message queues, third-party APIs, hardware interfaces.

---

## 4. Shared Test Fixtures

For cross-component contracts, use shared fixture files in `test-fixtures/` at the repo root. Both components' test suites load the same fixture and verify their side of the contract.

```
test-fixtures/
  api/
    create_user_request.json
    create_user_response.json
  events/
    user_created_event.json
  [protocol]/
    [payload_name].bin
```

If component A produces data and component B consumes it, a shared fixture ensures they agree on the format. If either side changes, the other's tests break immediately.

---

## 5. CI Integration

Each component's CI workflow should:

1. Install dependencies
2. Run linter / static analysis
3. Run all tests
4. Report results (fail the PR if any test fails)

Optional but recommended:
- Report coverage percentage (informational, not blocking)
- Archive test results as build artifacts
- Run integration tests against emulators or staging (if available)

---

## 6. Quick Reference

<!-- Replace with your actual commands -->

| What | Command |
|---|---|
| All [component 1] tests | `[command]` |
| All [component 2] tests | `[command]` |
| Specific test file | `[command] path/to/test` |
| With coverage | `[command] --coverage` |
| Watch mode | `[command] --watch` |

---

*Customize this document for your project's actual tech stack and test frameworks.*
