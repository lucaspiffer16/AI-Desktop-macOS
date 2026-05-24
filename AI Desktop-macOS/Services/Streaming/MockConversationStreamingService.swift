import Foundation

struct MockConversationStreamingService: ConversationStreaming {
    func streamResponse(for prompt: String) -> AsyncThrowingStream<StreamEvent, Error> {
        AsyncThrowingStream { continuation in
            Task {
                let response = "Streaming response for: \(prompt)"
                let tokens = response.split(separator: " ").map(String.init)

                for token in tokens {
                    if Task.isCancelled {
                        continuation.finish()
                        return
                    }

                    continuation.yield(.token(token + " "))
                    try? await Task.sleep(for: .milliseconds(180))
                }

                continuation.yield(.completed)
                continuation.finish()
            }
        }
    }
}
