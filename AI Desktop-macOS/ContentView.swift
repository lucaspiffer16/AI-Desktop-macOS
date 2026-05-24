//
//  ContentView.swift
//  AI Desktop-macOS
//
//  Created by Lucas Piffer on 23/05/26.
//

import SwiftUI

struct ContentView: View {
    private let connectivityService = OpenAIProviderConnectivityService(client: OpenAIProviderClient())
    private let streamingService = MockConversationStreamingService()

    var body: some View {
        NavigationStack {
            TabView {
                ProviderManagementView(
                    viewModel: ProviderManagementViewModel(connectivityValidator: connectivityService)
                )
                .tabItem {
                    Label("Providers", systemImage: "link")
                }

                ConversationView(
                    viewModel: ConversationViewModel(streamingService: streamingService)
                )
                .tabItem {
                    Label("Conversation", systemImage: "bubble.left.and.bubble.right")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
