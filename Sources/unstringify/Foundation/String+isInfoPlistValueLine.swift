import Foundation

extension String {
    var isInfoPlistValueLine: Bool {
        // precondition: there aren't multiline comments
        return hasPrefix("\"infoplist_")
    }
}
