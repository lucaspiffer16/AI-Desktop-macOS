import Foundation

struct ProviderCredentialService {
    private let store: ProviderCredentialStoring

    init(store: ProviderCredentialStoring) {
        self.store = store
    }

    func saveProviderAPIKey(_ apiKey: String, providerID: String) -> Result<ProviderCredentialReference, String> {
        do {
            let reference = try store.saveAPIKey(apiKey, forProviderID: providerID)
            return .success(reference)
        } catch {
            return .failure(map(error))
        }
    }

    func loadProviderAPIKey(reference: ProviderCredentialReference) -> Result<String, String> {
        do {
            return .success(try store.readAPIKey(for: reference))
        } catch {
            return .failure(map(error))
        }
    }

    func removeProviderAPIKey(reference: ProviderCredentialReference) -> Result<Void, String> {
        do {
            try store.deleteAPIKey(for: reference)
            return .success(())
        } catch {
            return .failure(map(error))
        }
    }

    private func map(_ error: Error) -> String {
        if let storeError = error as? KeychainProviderCredentialStore.CredentialStoreError {
            switch storeError {
            case .invalidInput:
                return "Invalid provider credential input."
            case .itemNotFound:
                return "No credential found for this provider reference."
            case .keychainFailure:
                return "Could not access secure credential storage."
            }
        }

        return "Unexpected credential storage error."
    }
}
