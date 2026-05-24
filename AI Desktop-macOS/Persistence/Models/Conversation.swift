import Foundation
import SwiftData

@Model
final class Conversation {
    var id: UUID
    var title: String
    var createdAt: Date
    var updatedAt: Date
    var lastMessageAt: Date

    @Relationship(deleteRule: .cascade, inverse: \Message.conversation)
    var messages: [Message]

    init(title: String, now: Date = .now) {
        self.id = UUID()
        self.title = title
        self.createdAt = now
        self.updatedAt = now
        self.lastMessageAt = now
        self.messages = []
    }
}
