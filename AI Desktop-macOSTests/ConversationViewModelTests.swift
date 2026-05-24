import Testing
@testable import AI_Desktop_macOS

@MainActor
struct ConversationViewModelTests {
    @Test func sendPromptStreamsTokensAndCompletes() async {
        let viewModel = ConversationViewModel(streamingService: MockConversationStreamingService())
        viewModel.prompt = "hello"

        viewModel.sendPrompt()
        try? await Task.sleep(for: .milliseconds(1200))

        #expect(!viewModel.streamedResponse.isEmpty)
        #expect(viewModel.state == .completed)
    }

    @Test func cancelStreamingSetsCanceledState() async {
        let viewModel = ConversationViewModel(streamingService: MockConversationStreamingService())
        viewModel.prompt = "cancel me"

        viewModel.sendPrompt()
        viewModel.cancelStreaming()

        #expect(viewModel.state == .canceled)
    }
}
