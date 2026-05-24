import Foundation

protocol ProviderCredentialStoring {
    func saveAPIKey(_ apiKey: String, forProviderID providerID: String) throws -> ProviderCredentialReference
    func readAPIKey(for reference: ProviderCredentialReference) throws -> String
    func deleteAPIKey(for reference: ProviderCredentialReference) throws
}
