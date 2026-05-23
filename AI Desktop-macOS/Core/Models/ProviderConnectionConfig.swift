import Foundation

struct ProviderConnectionConfig {
    let baseURL: URL
    let apiKey: String?
    let timeoutSeconds: TimeInterval

    init(baseURL: URL, apiKey: String?, timeoutSeconds: TimeInterval = 10) {
        self.baseURL = baseURL
        self.apiKey = apiKey
        self.timeoutSeconds = timeoutSeconds
    }
}
