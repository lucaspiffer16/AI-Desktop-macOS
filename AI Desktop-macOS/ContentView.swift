//
//  ContentView.swift
//  AI Desktop-macOS
//
//  Created by Lucas Piffer on 23/05/26.
//

import SwiftUI

struct ContentView: View {
    private let connectivityService = OpenAIProviderConnectivityService(client: OpenAIProviderClient())

    var body: some View {
        NavigationStack {
            ProviderManagementView(
                viewModel: ProviderManagementViewModel(connectivityValidator: connectivityService)
            )
        }
    }
}

#Preview {
    ContentView()
}
