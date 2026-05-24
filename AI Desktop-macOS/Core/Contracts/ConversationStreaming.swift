import Foundation

protocol ConversationStreaming {
    func streamResponse(for prompt: String) -> AsyncThrowingStream<StreamEvent, Error>
}
