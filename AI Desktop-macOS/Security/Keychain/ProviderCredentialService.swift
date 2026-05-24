import Foundation

enum ProviderCredentialServiceError: Error, Equatable {
    case invalidInput
    case itemNotFound
    case keychainFailure
    case unexpected

    var message: String {
        switch self {
        case .invalidInput:
            return "Invalid provider credential input."
        case .itemNotFound:
            return "No credential found for this provider reference."
        case .keychainFailure:
            return "Could not access secure credential storage."
        case .unexpected:
            return "Unexpected credential storage error."
        }
    }
}

struct ProviderCredentialService {
    private let store: ProviderCredentialStoring

    init(store: ProviderCredentialStoring) {
        self.store = store
    }

    func saveProviderAPIKey(_ apiKey: String, providerID: String) -> Result<ProviderCredentialReference, ProviderCredentialServiceError> {
        do {
            let reference = try store.saveAPIKey(apiKey, forProviderID: providerID)
            return .success(reference)
        } catch {
            return .failure(map(error))
        }
    }

    func loadProviderAPIKey(reference: ProviderCredentialReference) -> Result<String, ProviderCredentialServiceError> {
        do {
            return .success(try store.readAPIKey(for: reference))
        } catch {
            return .failure(map(error))
        }
    }

    func removeProviderAPIKey(reference: ProviderCredentialReference) -> Result<Void, ProviderCredentialServiceError> {
        do {
            try store.deleteAPIKey(for: reference)
            return .success(())
        } catch {
            return .failure(map(error))
        }
    }

    private func map(_ error: Error) -> ProviderCredentialServiceError {
        if let storeError = error as? KeychainProviderCredentialStore.CredentialStoreError {
            switch storeError {
            case .invalidInput:
                return .invalidInput
            case .itemNotFound:
                return .itemNotFound
            case .keychainFailure:
                return .keychainFailure
            }
        }

        return .unexpected
    }
}
