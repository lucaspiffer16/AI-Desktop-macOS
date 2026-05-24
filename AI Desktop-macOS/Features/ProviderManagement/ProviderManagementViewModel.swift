import Foundation
import Combine

@MainActor
final class ProviderManagementViewModel: ObservableObject {
    enum ConnectionState: Equatable {
        case idle
        case testing
        case success(message: String)
        case failure(message: String)
    }

    @Published var baseURLText: String = "https://api.openai.com/v1"
    @Published var apiKey: String = ""
    @Published private(set) var connectionState: ConnectionState = .idle

    private let connectivityValidator: ProviderConnectivityValidating

    init(connectivityValidator: ProviderConnectivityValidating) {
        self.connectivityValidator = connectivityValidator
    }

    func testConnection() async {
        guard let baseURL = URL(string: baseURLText), baseURL.scheme?.hasPrefix("http") == true else {
            connectionState = .failure(message: "Please provide a valid endpoint URL.")
            return
        }

        connectionState = .testing

        let config = ProviderConnectionConfig(
            baseURL: baseURL,
            apiKey: apiKey.trimmingCharacters(in: .whitespacesAndNewlines)
        )

        let result = await connectivityValidator.validate(config: config)
        if result.isSuccess {
            connectionState = .success(message: "\(result.message) Models found: \(result.modelCount).")
        } else {
            connectionState = .failure(message: result.message)
        }
    }
}
