import Foundation

struct DefaultErrorMapper: ErrorMapper {
    func map(_ error: Error) -> String {
        if let urlError = error as? URLError {
            switch urlError.code {
            case .timedOut:
                return "Connection timed out. Please verify endpoint availability and try again."
            case .notConnectedToInternet:
                return "No internet connection available."
            case .cannotFindHost, .cannotConnectToHost, .dnsLookupFailed:
                return "Could not reach provider host. Check base URL and network settings."
            default:
                return "Connection failed: \(urlError.localizedDescription)"
            }
        }

        if let providerError = error as? OpenAIProviderClient.ClientError {
            switch providerError {
            case .invalidEndpoint:
                return "Invalid provider endpoint URL."
            case .invalidResponse:
                return "Provider returned an invalid response."
            case .unauthorized:
                return "Authentication failed. Check API key and permissions."
            case .httpError(let statusCode):
                return "Provider request failed with status code \(statusCode)."
            }
        }

        return "Unexpected provider error: \(error.localizedDescription)"
    }
}
