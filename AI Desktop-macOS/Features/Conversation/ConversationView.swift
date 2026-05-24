import SwiftUI

struct ConversationView: View {
    @StateObject private var viewModel: ConversationViewModel

    init(viewModel: ConversationViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Conversation Streaming")
                .font(.title2.bold())

            TextField("Type your prompt", text: $viewModel.prompt)
                .textFieldStyle(.roundedBorder)

            HStack {
                Button("Send") {
                    viewModel.sendPrompt()
                }
                .disabled(viewModel.prompt.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || isStreaming)

                Button("Cancel") {
                    viewModel.cancelStreaming()
                }
                .disabled(!isStreaming)
            }

            GroupBox("Assistant Response") {
                ScrollView {
                    Text(viewModel.streamedResponse.isEmpty ? "No response yet." : viewModel.streamedResponse)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 4)
                }
                .frame(minHeight: 140)
            }

            Text(statusMessage)
                .foregroundStyle(statusColor)

            Spacer()
        }
        .padding()
    }

    private var isStreaming: Bool {
        if case .streaming = viewModel.state { return true }
        return false
    }

    private var statusMessage: String {
        switch viewModel.state {
        case .idle:
            return "Idle"
        case .streaming:
            return "Streaming..."
        case .completed:
            return "Completed"
        case .failed(let message):
            return message
        case .canceled:
            return "Canceled"
        }
    }

    private var statusColor: Color {
        switch viewModel.state {
        case .idle:
            return .secondary
        case .streaming:
            return .blue
        case .completed:
            return .green
        case .failed:
            return .red
        case .canceled:
            return .orange
        }
    }
}
