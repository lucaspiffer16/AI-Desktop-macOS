import Testing
@testable import AI_Desktop_macOS

struct ProviderCredentialServiceTests {
    @Test func saveReturnsReferenceWhenStoreSucceeds() {
        let store = MockProviderCredentialStore()
        let service = ProviderCredentialService(store: store)

        let result = service.saveProviderAPIKey("abc123", providerID: "openai")

        switch result {
        case .success(let reference):
            #expect(reference.keychainAccount.contains("openai"))
        case .failure:
            Issue.record("Expected save success")
        }
    }

    @Test func loadReturnsFriendlyMessageWhenCredentialMissing() {
        let store = MockProviderCredentialStore(shouldThrowOnRead: true)
        let service = ProviderCredentialService(store: store)
        let reference = ProviderCredentialReference(keychainAccount: "provider.openai.api-key")

        let result = service.loadProviderAPIKey(reference: reference)

        switch result {
        case .success:
            Issue.record("Expected read failure")
        case .failure(let error):
            #expect(error == .itemNotFound)
            #expect(error.message == "No credential found for this provider reference.")
        }
    }
}

private struct MockProviderCredentialStore: ProviderCredentialStoring {
    let shouldThrowOnRead: Bool

    init(shouldThrowOnRead: Bool = false) {
        self.shouldThrowOnRead = shouldThrowOnRead
    }

    func saveAPIKey(_ apiKey: String, forProviderID providerID: String) throws -> ProviderCredentialReference {
        ProviderCredentialReference(keychainAccount: "provider.\(providerID).api-key")
    }

    func readAPIKey(for reference: ProviderCredentialReference) throws -> String {
        if shouldThrowOnRead {
            throw KeychainProviderCredentialStore.CredentialStoreError.itemNotFound
        }

        return "abc123"
    }

    func deleteAPIKey(for reference: ProviderCredentialReference) throws {}
}
