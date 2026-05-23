---
title: Data Model Spec
aliases: ["Domain Data Model"]
tags: [tech/domain, tech/persistence, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# Data Model Spec

## Entities

### Provider

- `id: UUID` (pk)
- `name: String` (required)
- `type: ProviderType` (openaiCompatible|ollama|lmStudio)
- `baseURL: String` (required)
- `apiKeyRef: String?` (keychain reference, not raw key)
- `defaultModel: String?`
- `isActive: Bool`
- `createdAt: Date`
- `updatedAt: Date`

### Conversation

- `id: UUID` (pk)
- `title: String` (required)
- `providerId: UUID` (fk -> Provider)
- `model: String` (required)
- `isPinned: Bool`
- `createdAt: Date`
- `updatedAt: Date`
- `lastMessageAt: Date`

### Message

- `id: UUID` (pk)
- `conversationId: UUID` (fk -> Conversation)
- `role: MessageRole` (user|assistant|system)
- `content: String` (required)
- `streamState: StreamState` (none|streaming|completed|canceled|failed)
- `sequence: Int` (monotonic per conversation)
- `createdAt: Date`
- `updatedAt: Date`

### AppSettings

- `id: UUID` (pk singleton)
- `privacyModeDefault: PrivacyMode`
- `blurEnabled: Bool`
- `compactEnabled: Bool`
- `shortcutOpenApp: String`
- `shortcutPrivacyToggle: String`
- `shortcutHideWindow: String`
- `updatedAt: Date`

## Relationships

- Provider `1:N` Conversation
- Conversation `1:N` Message

## Constraints

- Unique provider tuple `(name, baseURL)`.
- Message `sequence` unique per `conversationId`.
- Delete conversation cascades message deletion.

## Indexing Recommendations

- Conversation: index on `lastMessageAt` for sidebar ordering.
- Message: composite index on `(conversationId, sequence)`.
- Provider: index on `(type, isActive)`.

## Related

- [[Provider_Domain]]
- [[Conversation_Domain]]
- [[Message_Domain]]
- [[SwiftData_Strategy]]
