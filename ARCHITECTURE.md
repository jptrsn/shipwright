# [Project Name]: System Architecture

**Version:** 0.1.0-draft
**Last Updated:** [DATE]
**Status:** Design Specification

---

## 1. Overview

[What does this system do? Who is it for? What problem does it solve?]

### 1.1 Design Principles

<!-- List 3-7 principles that guide architectural decisions. These help agents
     make consistent choices when the spec doesn't cover a specific case. Examples: -->

- [Principle 1 — e.g., "Offline-first: the app must work without internet"]
- [Principle 2 — e.g., "The backend is the source of truth for authorization"]
- [Principle 3 — e.g., "No PII stored on embedded devices"]

### 1.2 Use Cases

<!-- Describe 3-5 primary use cases. These ground the architecture in real user scenarios
     and help agents understand WHY things are designed the way they are. -->

**UC1: [Name]**
[Description of the user flow]

**UC2: [Name]**
[Description of the user flow]

---

## 2. Component Architecture

### 2.1 Components

<!-- List each major component with its technology and responsibility.
     One component = one deployable unit or one directory in a monorepo. -->

| Component | Technology | Responsibility |
|---|---|---|
| [Component 1] | [Language/Framework] | [What it does] |
| [Component 2] | [Language/Framework] | [What it does] |

### 2.2 Communication Paths

<!-- How do components talk to each other? What protocols, formats, auth? -->

| Path | Protocol | Direction | Purpose |
|---|---|---|---|
| [A → B] | [HTTP/gRPC/BLE/etc.] | [Uni/Bidirectional] | [What data flows] |

### 2.3 Data Flow

<!-- Describe the primary data flow through the system for the main use case.
     Numbered steps are clearest. -->

1. [Step 1]
2. [Step 2]
3. ...

---

## 3. Data Model

<!-- Define the authoritative data model. This is the contract that all components
     reference. If you use a database, define the schema here. If you use an API,
     define the request/response shapes here. -->

### 3.1 [Entity 1]

| Field | Type | Description |
|---|---|---|
| [field] | [type] | [description] |

### 3.2 [Entity 2]

| Field | Type | Description |
|---|---|---|
| [field] | [type] | [description] |

---

## 4. API Contracts

<!-- Define the interfaces between components. These are the "do not change without
     updating all consumers" boundaries. -->

### 4.1 [API/Protocol Name]

[Define endpoints, message formats, error codes, versioning strategy]

---

## 5. Security

<!-- Authentication, authorization, data protection, secrets management -->

---

## 6. Error Handling

<!-- Error code ranges, error response formats, retry strategies -->

---

## 7. Configuration

<!-- What's configurable? Where are config values stored? What are the defaults? -->

---

## 8. Technology Stack

| Component | Technology | Rationale |
|---|---|---|
| [Component] | [Technology] | [Why this choice] |

---

## 9. Repository Structure

```
[project-name]/
├── [component-1]/
├── [component-2]/
├── docs/
├── stories/
├── test-fixtures/
└── ...
```

---

*This document is the authoritative reference for system-level architecture. Component-specific details are in the corresponding spec documents in `docs/`.*
