import Foundation

enum StreamEvent: Equatable {
    case token(String)
    case completed
}
