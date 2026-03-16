# Test Fixtures

Shared test data for cross-component contract tests. Both sides of a contract load the same fixture file to verify their encoder/decoder agrees on the format.

Organize by contract type:

```
test-fixtures/
  api/                    # API request/response payloads
  events/                 # Event payloads
  [protocol]/             # Wire protocol messages
```

See `CONTRIBUTING.md` Section 7 (Integration Testing Strategy) for details.
