import Foundation
import Security

struct KeychainProviderCredentialStore: ProviderCredentialStoring {
    enum CredentialStoreError: Error {
        case invalidInput
        case itemNotFound
        case keychainFailure(OSStatus)
    }

    private let service = "com.piffer.ai-desktop.provider-credentials"

    func saveAPIKey(_ apiKey: String, forProviderID providerID: String) throws -> ProviderCredentialReference {
        let trimmedProviderID = providerID.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedKey = apiKey.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !trimmedProviderID.isEmpty, !trimmedKey.isEmpty else {
            throw CredentialStoreError.invalidInput
        }

        guard let keyData = trimmedKey.data(using: .utf8) else {
            throw CredentialStoreError.invalidInput
        }

        let account = accountName(forProviderID: trimmedProviderID)

        let updateQuery: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
        ]

        let attributesToUpdate: [CFString: Any] = [
            kSecValueData: keyData,
        ]

        let updateStatus = SecItemUpdate(updateQuery as CFDictionary, attributesToUpdate as CFDictionary)

        if updateStatus == errSecSuccess {
            return ProviderCredentialReference(keychainAccount: account)
        }

        if updateStatus == errSecItemNotFound {
            let addQuery: [CFString: Any] = [
                kSecClass: kSecClassGenericPassword,
                kSecAttrService: service,
                kSecAttrAccount: account,
                kSecValueData: keyData,
            ]

            let addStatus = SecItemAdd(addQuery as CFDictionary, nil)
            guard addStatus == errSecSuccess else {
                throw CredentialStoreError.keychainFailure(addStatus)
            }

            return ProviderCredentialReference(keychainAccount: account)
        }

        throw CredentialStoreError.keychainFailure(updateStatus)
    }

    func readAPIKey(for reference: ProviderCredentialReference) throws -> String {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: reference.keychainAccount,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne,
        ]

        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)

        if status == errSecItemNotFound {
            throw CredentialStoreError.itemNotFound
        }

        guard status == errSecSuccess else {
            throw CredentialStoreError.keychainFailure(status)
        }

        guard let data = item as? Data, let apiKey = String(data: data, encoding: .utf8) else {
            throw CredentialStoreError.keychainFailure(errSecDecode)
        }

        return apiKey
    }

    func deleteAPIKey(for reference: ProviderCredentialReference) throws {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: reference.keychainAccount,
        ]

        let status = SecItemDelete(query as CFDictionary)

        if status == errSecItemNotFound {
            return
        }

        guard status == errSecSuccess else {
            throw CredentialStoreError.keychainFailure(status)
        }
    }

    private func accountName(forProviderID providerID: String) -> String {
        "provider.\(providerID).api-key"
    }
}
