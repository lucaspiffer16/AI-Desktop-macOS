# AI Desktop macOS

## MVP Product Requirements + Technical Specification

---

# PART 1 — PRODUCT REQUIREMENTS DOCUMENT (PRD)

# 1. Product Overview

## Product Name

AI Desktop macOS

## Product Vision

Create a native macOS desktop application focused on conversational AI interactions using both local and remote AI providers.

The product must prioritize:

- Native macOS experience;
- Privacy-oriented workflows;
- Multi-provider architecture;
- Local-first philosophy;
- Fast conversational access;
- Extensibility for future AI tooling.

The application should behave as a professional productivity tool rather than a simple chatbot wrapper.

---

# 2. Main Goals

## Primary Goals

- Allow users to connect multiple AI providers;
- Support local AI execution through local endpoints;
- Support remote AI providers through APIs;
- Provide fast conversational interactions;
- Preserve privacy during work sessions;
- Maintain conversation history locally;
- Offer a native macOS user experience.

## Secondary Goals

- Support future contextual memory;
- Support future RAG workflows;
- Support future project/file integrations;
- Support future AI agents and tools.

---

# 3. MVP Scope

## Included in MVP

### Provider Management

The application must allow users to:

- Add providers;
- Edit providers;
- Remove providers;
- Test provider connection;
- Select models;
- Configure OpenAI-compatible endpoints.

### Supported Providers (Initial)

- OpenAI-compatible APIs;
- LM Studio;
- Ollama.

### Conversation Features

The application must support:

- Create conversations;
- Delete conversations;
- Rename conversations;
- Stream responses;
- Persist local conversation history;
- Switch models per conversation.

### Privacy Features

The application must support:

- Manual privacy mode;
- Blur content mode;
- Hide window shortcut;
- Compact mode;
- Optional capture restriction attempts.

### Security Features

The application must:

- Store secrets using macOS Keychain;
- Never store raw API keys in plain text;
- Persist local data securely.

### Desktop Features

The application must support:

- Native SwiftUI interface;
- Global keyboard shortcuts;
- Native window management;
- Sidebar conversation navigation.

---

# 4. Out of Scope (MVP)

The MVP must NOT include:

- Multi-user collaboration;
- Cloud synchronization;
- Mobile applications;
- AI agents;
- Tool calling;
- Voice interaction;
- OCR;
- File embedding;
- RAG pipelines;
- Plugin marketplace;
- Team management.

Because trying to ship all of this at once is how software projects become archaeological ruins.

---

# 5. User Personas

## Persona 1 — Developer

Needs:

- Fast access to local models;
- API flexibility;
- Privacy during screen sharing;
- Local-first workflows.

## Persona 2 — Technical Professional

Needs:

- Multiple providers;
- Reliable history;
- Minimal configuration;
- Fast responses.

## Persona 3 — Privacy-Oriented User

Needs:

- Local model support;
- Hidden/blurred screen modes;
- Local data storage;
- Reduced cloud dependency.

---

# 6. Product Principles

## Native First

The application must feel like a real macOS application.

## Local First

Conversation history must remain local by default.

## Provider Agnostic

The application must not depend on a single AI vendor.

## Privacy by Design

Privacy controls must exist from the beginning.

## Extensible Architecture

Future AI integrations must be possible without major rewrites.

---

# 7. Main User Flows

## Flow 1 — Add Provider

1. User opens settings;
2. User selects “Add Provider”;
3. User enters:
   - provider name;
   - base URL;
   - API key;
   - provider type;
4. User clicks “Test Connection”;
5. System validates endpoint;
6. System lists available models;
7. User saves provider.

---

## Flow 2 — Start Conversation

1. User opens app;
2. User selects provider/model;
3. User creates conversation;
4. User sends message;
5. System streams response;
6. Conversation is persisted locally.

---

## Flow 3 — Privacy Mode

1. User presses global shortcut;
2. Application instantly:
   - hides content;
   - blurs content;
   - or minimizes window;
3. User exits privacy mode;
4. Previous state is restored.

---

# 8. Privacy Requirements

## Important Product Constraint

The application MUST NOT claim guaranteed invisibility during all screen recording or sharing scenarios.

Instead:

The application should provide:

- privacy assistance;
- content protection;
- accidental exposure reduction.

Because macOS capture APIs and third-party recording software may still capture visual content depending on the environment.

---

# 9. UX Requirements

## Main Layout

### Left Sidebar

- Conversations;
- Search;
- Pinned chats.

### Main Area

- Conversation messages;
- Streaming responses;
- Input composer.

### Top Bar

- Current provider;
- Current model;
- Privacy toggle;
- Settings access.

---

# 10. MVP Acceptance Criteria

## Provider Management

### AC-001

Given a valid OpenAI-compatible endpoint, when the user tests the provider, then the application must validate connectivity successfully.

### AC-002

Given valid credentials, when the user saves the provider, then the API key must be stored securely in Keychain.

---

## Conversation

### AC-003

Given an active conversation, when the user sends a message, then the assistant response must stream progressively.

### AC-004

Given a saved conversation, when the application restarts, then the conversation history must persist locally.

---

## Privacy

### AC-005

Given privacy mode is enabled, when the user activates the shortcut, then the content must be hidden or blurred immediately.

### AC-006

Given privacy mode is disabled, when the user exits privacy mode, then the conversation state must be restored.

---

# 11. MVP Deliverables

## Deliverable 1

Native macOS application.

## Deliverable 2

Provider abstraction layer.

## Deliverable 3

Streaming conversational interface.

## Deliverable 4

Secure local storage.

## Deliverable 5

Privacy mode.

---

# 12. Product Roadmap

## Phase 1 — MVP

- Provider management;
- Streaming chat;
- Local storage;
- Privacy mode.

## Phase 2

- Prompt templates;
- Workspace profiles;
- Export/import;
- Better conversation search.

## Phase 3

- File context;
- RAG;
- AI tools;
- Agents;
- Plugin system.

---

---

# PART 2 — TECHNICAL SPECIFICATION DOCUMENT

# 1. Technical Overview

## Architecture Style

The application will use:

- Native Swift;
- SwiftUI;
- MVVM architecture;
- Service-oriented infrastructure;
- Provider abstraction layer;
- SwiftData as the initial local persistence solution.

The MVP should prioritize native local persistence before introducing distributed synchronization layers.

---

# 2. Target Platform

## Operating System

- macOS 14+

## Architecture

- Apple Silicon (Primary)
- Intel support optional

---

# 3. Tech Stack

| Layer        | Technology          |
| ------------ | ------------------- |
| Language     | Swift               |
| UI           | SwiftUI             |
| Persistence  | SwiftData (initial MVP persistence) |
| Networking   | URLSession          |
| Secrets      | Keychain            |
| Concurrency  | async/await         |
| Streaming    | AsyncSequence       |
| Architecture | MVVM                |

---

# 4. High-Level Architecture

```txt
AI Desktop App
│
├── App Layer
├── UI Layer
├── ViewModels
├── Services
├── Provider Layer
├── Persistence Layer
├── Security Layer
└── Privacy Layer
```

---

# 5. Modular Architecture Strategy

The application should be separated into isolated domains.

Recommended architectural domains:

- Application Layer;
- Core Domain Layer;
- Provider Layer;
- Conversation Layer;
- Persistence Layer;
- Privacy Layer;
- Security Layer;
- Shared Infrastructure Layer.

Each domain should maintain clear responsibilities and low coupling.

---

# 6. Architectural Principles

## Provider Abstraction

The application must communicate through a generic provider interface.

No UI component should directly depend on vendor-specific APIs.

---

## Local Persistence Isolation

Persistence must remain independent from provider implementations.

---

## Privacy Isolation

Privacy features must remain isolated from conversation rendering.

---

# 7. Core Architectural Contracts

## Provider Abstraction

The system must use a provider abstraction strategy.

This means:

- the UI must not directly depend on specific AI vendors;
- provider integrations must remain isolated;
- new providers should be added with minimal impact on existing features;
- local and remote providers must behave consistently from the user perspective.

The provider layer should support:

- model listing;
- conversational interactions;
- streaming responses;
- capability detection;
- provider-specific configuration.

---

# 8. Core Data Domains

## Provider Configuration Domain

The provider domain should represent:

- provider identity;
- provider type;
- endpoint configuration;
- authentication references;
- default model behavior;
- activation state.

---

## Conversation Domain

The conversation domain should represent:

- conversation lifecycle;
- linked provider/model;
- timestamps;
- local persistence behavior.

---

## Message Domain

The message domain should represent:

- user messages;
- assistant messages;
- system messages;
- streaming state;
- temporal ordering.

---

# 9. Persistence Strategy

## MVP Persistence Decision

The MVP will officially adopt SwiftData as the primary persistence solution.

This decision was made due to:

- native Apple ecosystem integration;
- reduced implementation complexity;
- faster MVP delivery;
- good alignment with SwiftUI workflows;
- sufficient capability for initial local persistence requirements.

The persistence layer will initially support:

- providers;
- conversations;
- messages;
- local application settings;
- privacy-related preferences.

API keys and secrets MUST remain outside SwiftData and continue being stored exclusively in Keychain.

---

## Cloud Synchronization Strategy

Cloud synchronization is intentionally OUT OF SCOPE for the MVP.

CloudKit should NOT be enabled during the initial implementation phase.

Reasons:

- reduced architectural complexity;
- reduced synchronization edge cases;
- simplified debugging;
- lower coupling to iCloud infrastructure;
- focus on stabilizing local-first behavior.

The architecture should still remain future-compatible with optional CloudKit integration.

---

## Future Migration Option

If advanced querying becomes necessary:

- migrate to SQLite;
- optionally use GRDB.

---

# 10. Security Strategy

## API Keys

API keys MUST:

- be stored in Keychain;
- never exist in plain text storage;
- never be logged.

---

## Local Data

Conversation history may optionally support:

- encrypted persistence;
- secure export;
- wipe functionality.

---

# 11. Networking Strategy

## Transport

Use:

- URLSession;
- async/await;
- streaming responses.

---

## Supported Patterns

### OpenAI-Compatible APIs

Support:

- /chat/completions;
- SSE streaming;
- bearer authentication.

---

## Local Providers

Support:

- localhost endpoints;
- custom ports;
- HTTP fallback.

---

# 12. Privacy Layer

## Privacy Modes

### Blur Mode

Applies visual blur overlay.

### Compact Mode

Hides conversation content.

### Hide Mode

Minimizes or hides application window.

### Capture Restriction Attempt

The application may attempt to reduce screen capture visibility through native macOS window-sharing behaviors.

However:

- this should be treated as best-effort privacy assistance;
- not all screen recording software respects these restrictions;
- the product must not market this as guaranteed invisibility.

This limitation must remain explicit in both implementation and product communication.

---

# 13. Global Shortcuts

## Requirements

The application must support:

- open app shortcut;
- privacy mode shortcut;
- hide window shortcut.

Potential implementation approaches may include native macOS keyboard event monitoring and dedicated shortcut management abstractions.

---

# 14. Streaming Strategy

## Requirements

Assistant responses must stream progressively.

The UI must:

- update incrementally;
- avoid blocking the main thread;
- support cancellation.

---

# 15. Error Handling

## Requirements

Errors must be categorized:

- provider errors;
- authentication errors;
- timeout errors;
- persistence errors;
- network errors.

User-facing messages must remain human-readable.

Error handling must prioritize clarity and operational usability rather than exposing low-level technical messages directly to end users.

---

# 16. Performance Requirements

## Startup

Cold startup target:

- under 2 seconds.

## Streaming

UI updates must remain smooth during token streaming.

## Memory

Avoid loading entire conversation histories unnecessarily.

---

# 17. Accessibility Requirements

The application should support:

- VoiceOver compatibility;
- keyboard navigation;
- scalable text sizes.

---

# 18. Future Expansion Architecture

## Future CloudKit Support

The architecture should remain compatible with future optional CloudKit synchronization.

Potential future scenarios:

- multi-device synchronization;
- iPhone/iPad companion applications;
- conversation backup restoration;
- cross-device continuity.

CloudKit integration should only be introduced after:

- local persistence stabilizes;
- conversation architecture matures;
- synchronization conflict strategies are defined;
- offline behavior is validated.

The application should avoid hard-coupling the persistence domain directly to CloudKit-specific behaviors.

---

The architecture should support future:

- RAG systems;
- embeddings;
- file indexing;
- agents;
- MCP integrations;
- plugins;
- cloud sync.

Without requiring provider layer rewrites.

---

# 19. Initial Development Milestones

## Milestone 1

Project bootstrap.

## Milestone 2

Provider abstraction.

## Milestone 3

Streaming chat.

## Milestone 4

Persistence.

## Milestone 5

Privacy mode.

## Milestone 6

Polish and stabilization.

---

# 20. Documentation and Design Preparation

Before implementation begins, the project should define:

- wireframes;
- navigation flows;
- provider integration contracts;
- persistence diagrams;
- privacy validation matrix;
- UX states;
- streaming behavior flows;
- error-state behaviors.

The goal is to stabilize product and architectural decisions before implementation scaling begins.

---

# 21. Recommended Next Step

Before coding:

Create:

- wireframes;
- navigation flows;
- provider API contracts;
- persistence diagrams;
- privacy behavior validation matrix.

Because fixing architecture before implementation is dramatically cheaper than rewriting an emotionally damaged codebase later.
