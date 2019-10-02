import Foundation

extension String {
    public var isKeyValueLine: Bool {
        // precondition: there aren't multiline comments
        return hasPrefix("\"")
    }
}
