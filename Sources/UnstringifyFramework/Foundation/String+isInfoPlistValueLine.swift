import Foundation

extension String {
    public var isInfoPlistValueLine: Bool {
        // precondition: there aren't multiline comments
        return hasPrefix("\"infoplist_")
    }
}
