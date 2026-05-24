import Foundation
import SwiftData

@Model
final class Message {
    enum Role: String, Codable {
        case user
        case assistant
        case system
    }

    var id: UUID
    var role: Role
    var content: String
    var sequence: Int
    var createdAt: Date

    var conversation: Conversation?

    init(role: Role, content: String, sequence: Int, conversation: Conversation, now: Date = .now) {
        self.id = UUID()
        self.role = role
        self.content = content
        self.sequence = sequence
        self.createdAt = now
        self.conversation = conversation
    }
}
