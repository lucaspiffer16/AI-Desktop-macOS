import Foundation
import Combine

@MainActor
final class ConversationViewModel: ObservableObject {
    enum StreamingState: Equatable {
        case idle
        case streaming
        case completed
        case failed(String)
        case canceled
    }

    @Published var prompt: String = ""
    @Published private(set) var streamedResponse: String = ""
    @Published private(set) var state: StreamingState = .idle

    private let streamingService: ConversationStreaming
    private var streamTask: Task<Void, Never>?

    init(streamingService: ConversationStreaming) {
        self.streamingService = streamingService
    }

    func sendPrompt() {
        let normalizedPrompt = prompt.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !normalizedPrompt.isEmpty else { return }

        cancelStreaming(resetState: false)
        streamedResponse = ""
        state = .streaming

        streamTask = Task {
            do {
                for try await event in streamingService.streamResponse(for: normalizedPrompt) {
                    switch event {
                    case .token(let token):
                        streamedResponse += token
                    case .completed:
                        state = .completed
                    }
                }

                if state == .streaming {
                    state = .completed
                }
            } catch {
                state = .failed("Streaming failed. Please try again.")
            }
        }
    }

    func cancelStreaming(resetState: Bool = true) {
        streamTask?.cancel()
        streamTask = nil
        if resetState {
            state = .canceled
        }
    }
}
