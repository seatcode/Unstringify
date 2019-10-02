import Foundation

extension String {
    var isKeyValueLine: Bool {
        // precondition: there aren't multiline comments
        return hasPrefix("\"")
    }
}
