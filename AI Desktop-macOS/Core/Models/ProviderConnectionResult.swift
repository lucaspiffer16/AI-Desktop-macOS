import Foundation

struct ProviderConnectionResult {
    let isSuccess: Bool
    let message: String
    let modelCount: Int

    static func success(modelCount: Int) -> Self {
        Self(
            isSuccess: true,
            message: "Connection validated successfully.",
            modelCount: modelCount
        )
    }

    static func failure(message: String) -> Self {
        Self(
            isSuccess: false,
            message: message,
            modelCount: 0
        )
    }
}
