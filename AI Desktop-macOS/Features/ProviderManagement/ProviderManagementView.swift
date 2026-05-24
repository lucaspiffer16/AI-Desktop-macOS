import SwiftUI

struct ProviderManagementView: View {
    @StateObject private var viewModel: ProviderManagementViewModel

    init(viewModel: ProviderManagementViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Form {
            Section("Provider Setup") {
                TextField("Base URL", text: $viewModel.baseURLText)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()

                SecureField("API Key", text: $viewModel.apiKey)

                Button {
                    Task {
                        await viewModel.testConnection()
                    }
                } label: {
                    if case .testing = viewModel.connectionState {
                        ProgressView()
                    } else {
                        Text("Test Connection")
                    }
                }
                .disabled(isTesting)
            }

            Section("Result") {
                resultView
            }
        }
        .formStyle(.grouped)
        .navigationTitle("Provider Management")
    }

    private var isTesting: Bool {
        if case .testing = viewModel.connectionState {
            return true
        }
        return false
    }

    @ViewBuilder
    private var resultView: some View {
        switch viewModel.connectionState {
        case .idle:
            Text("Run a test to validate provider connectivity.")
                .foregroundStyle(.secondary)
        case .testing:
            Text("Testing provider connection...")
                .foregroundStyle(.secondary)
        case .success(let message):
            Text(message)
                .foregroundStyle(.green)
        case .failure(let message):
            Text(message)
                .foregroundStyle(.red)
        }
    }
}
