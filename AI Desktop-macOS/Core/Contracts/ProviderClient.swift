import Foundation

protocol ProviderClient {
    func listModels() async throws -> [String]
}
