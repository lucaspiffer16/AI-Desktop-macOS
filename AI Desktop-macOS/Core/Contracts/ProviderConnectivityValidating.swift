import Foundation

protocol ProviderConnectivityValidating {
    func validate(config: ProviderConnectionConfig) async -> ProviderConnectionResult
}
