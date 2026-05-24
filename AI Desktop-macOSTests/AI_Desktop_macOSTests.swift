//
//  AI_Desktop_macOSTests.swift
//  AI Desktop-macOSTests
//
//  Created by Lucas Piffer on 23/05/26.
//

import Testing
import SwiftData
@testable import AI_Desktop_macOS

struct AI_Desktop_macOSTests {
    private func makeInMemoryContainer() throws -> ModelContainer {
        let schema = Schema([
            Conversation.self,
            Message.self,
        ])
        let configuration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        return try ModelContainer(for: schema, configurations: [configuration])
    }

    @Test func savesConversationAndMessages() throws {
        let container = try makeInMemoryContainer()
        let context = ModelContext(container)

        let conversation = Conversation(title: "Conversation 1")
        context.insert(conversation)

        context.insert(Message(role: .user, content: "First", sequence: 1, conversation: conversation))
        context.insert(Message(role: .assistant, content: "Second", sequence: 2, conversation: conversation))

        try context.save()

        let descriptor = FetchDescriptor<Conversation>(sortBy: [SortDescriptor(\Conversation.createdAt)])
        let storedConversations = try context.fetch(descriptor)

        #expect(storedConversations.count == 1)
        #expect(storedConversations.first?.title == "Conversation 1")
        #expect(storedConversations.first?.messages.count == 2)
    }

    @Test func returnsMessagesInStableSequenceOrder() throws {
        let container = try makeInMemoryContainer()
        let context = ModelContext(container)

        let conversation = Conversation(title: "Sequence Test")
        context.insert(conversation)
        context.insert(Message(role: .assistant, content: "Third", sequence: 3, conversation: conversation))
        context.insert(Message(role: .user, content: "First", sequence: 1, conversation: conversation))
        context.insert(Message(role: .assistant, content: "Second", sequence: 2, conversation: conversation))

        try context.save()

        let messageDescriptor = FetchDescriptor<Message>(
            predicate: #Predicate { $0.conversation?.id == conversation.id },
            sortBy: [SortDescriptor(\Message.sequence)]
        )
        let orderedMessages = try context.fetch(messageDescriptor)

        #expect(orderedMessages.map(\.sequence) == [1, 2, 3])
        #expect(orderedMessages.map(\.content) == ["First", "Second", "Third"])
    }

    @Test func ordersConversationsByLastMessageDateDescending() throws {
        let container = try makeInMemoryContainer()
        let context = ModelContext(container)

        let olderDate = Date(timeIntervalSince1970: 100)
        let newerDate = Date(timeIntervalSince1970: 200)

        let olderConversation = Conversation(title: "Older", now: olderDate)
        olderConversation.lastMessageAt = olderDate
        let newerConversation = Conversation(title: "Newer", now: newerDate)
        newerConversation.lastMessageAt = newerDate

        context.insert(olderConversation)
        context.insert(newerConversation)
        try context.save()

        let descriptor = FetchDescriptor<Conversation>(
            sortBy: [SortDescriptor(\Conversation.lastMessageAt, order: .reverse)]
        )
        let orderedConversations = try context.fetch(descriptor)

        #expect(orderedConversations.map(\.title) == ["Newer", "Older"])
    }

}
