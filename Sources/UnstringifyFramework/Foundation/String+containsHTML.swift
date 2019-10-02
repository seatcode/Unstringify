import Foundation

extension String {
    public func containsHTML() throws -> Bool {
        return try !matches(regex: "\\<([a-zA-Z0-9]+)\\>.*?\\<\\/\\1\\>").isEmpty
    }
}
