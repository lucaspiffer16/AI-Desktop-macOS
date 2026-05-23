import Foundation

protocol ErrorMapper {
    func map(_ error: Error) -> String
}
