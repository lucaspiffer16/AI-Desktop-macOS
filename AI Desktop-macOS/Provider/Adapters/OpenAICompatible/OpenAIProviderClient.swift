import Foundation

struct OpenAIProviderClient: ProviderClient {
    enum ClientError: Error {
        case invalidEndpoint
        case unauthorized
        case httpError(Int)
        case invalidResponse
    }

    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func listModels(config: ProviderConnectionConfig) async throws -> [String] {
        let modelsURL = config.baseURL.appending(path: "models")

        var request = URLRequest(url: modelsURL)
        request.httpMethod = "GET"
        request.timeoutInterval = config.timeoutSeconds
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        if let apiKey = config.apiKey, !apiKey.isEmpty {
            request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        }

        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw ClientError.invalidResponse
        }

        switch httpResponse.statusCode {
        case 200:
            break
        case 401, 403:
            throw ClientError.unauthorized
        default:
            throw ClientError.httpError(httpResponse.statusCode)
        }

        let payload = try JSONDecoder().decode(OpenAIModelsPayload.self, from: data)
        return payload.data.map(\.id)
    }
}

private struct OpenAIModelsPayload: Decodable {
    let data: [Model]

    struct Model: Decodable {
        let id: String
    }
}
