import Foundation

protocol ProviderClient {
    func listModels(config: ProviderConnectionConfig) async throws -> [String]
}
