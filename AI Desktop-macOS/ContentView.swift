//
//  ContentView.swift
//  AI Desktop-macOS
//
//  Created by Lucas Piffer on 23/05/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: [SortDescriptor(\Conversation.lastMessageAt, order: .reverse)])
    private var conversations: [Conversation]

    @State private var selectedConversation: Conversation?
    @State private var messageInput: String = ""

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(conversations) { conversation in
                    Button {
                        selectedConversation = conversation
                    } label: {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(conversation.title)
                            Text(conversation.lastMessageAt, format: Date.FormatStyle(date: .abbreviated, time: .shortened))
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .buttonStyle(.plain)
                }
                .onDelete(perform: deleteConversations)
            }
            .navigationSplitViewColumnWidth(min: 180, ideal: 240)
            .toolbar {
                ToolbarItem {
                    Button(action: addConversation) {
                        Label("New Conversation", systemImage: "plus")
                    }
                }
            }
        } detail: {
            conversationDetail
        }
    }

    @ViewBuilder
    private var conversationDetail: some View {
        if let conversation = selectedConversation {
            VStack(spacing: 12) {
                List {
                    ForEach(conversation.messages.sorted(by: { $0.sequence < $1.sequence })) { message in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(message.role.rawValue.capitalized)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            Text(message.content)
                        }
                    }
                }

                HStack {
                    TextField("Type a message", text: $messageInput)
                    Button("Send") {
                        addMessage(to: conversation)
                    }
                    .disabled(messageInput.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .navigationTitle(conversation.title)
        } else {
            Text("Select or create a conversation")
                .foregroundStyle(.secondary)
        }
    }

    private func addConversation() {
        withAnimation {
            let nextNumber = conversations.count + 1
            let conversation = Conversation(title: "Conversation \(nextNumber)")
            modelContext.insert(conversation)
            selectedConversation = conversation
        }
    }

    private func addMessage(to conversation: Conversation) {
        let trimmed = messageInput.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }

        withAnimation {
            let sequence = (conversation.messages.map(\.sequence).max() ?? 0) + 1
            let message = Message(role: .user, content: trimmed, sequence: sequence, conversation: conversation)
            modelContext.insert(message)
            conversation.updatedAt = .now
            conversation.lastMessageAt = .now
            messageInput = ""
        }
    }

    private func deleteConversations(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                let conversation = conversations[index]
                if selectedConversation?.id == conversation.id {
                    selectedConversation = nil
                }
                modelContext.delete(conversation)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Conversation.self, Message.self], inMemory: true)
}
