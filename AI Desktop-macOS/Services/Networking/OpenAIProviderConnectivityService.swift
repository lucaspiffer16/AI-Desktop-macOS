import Foundation

struct OpenAIProviderConnectivityService: ProviderConnectivityValidating {
    private let client: ProviderClient
    private let errorMapper: ErrorMapper

    init(client: ProviderClient, errorMapper: ErrorMapper = DefaultErrorMapper()) {
        self.client = client
        self.errorMapper = errorMapper
    }

    func validate(config: ProviderConnectionConfig) async -> ProviderConnectionResult {
        do {
            let models = try await client.listModels(config: config)
            return .success(modelCount: models.count)
        } catch {
            return .failure(message: errorMapper.map(error))
        }
    }
}
