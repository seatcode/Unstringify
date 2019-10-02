import Foundation

public func parseKeys(_ content: String) throws -> [String] {
    let keyValueLines = content.components(separatedBy: "\n").filter { $0.isKeyValueLine }
    var keys = Set<String>()
    for line in keyValueLines {
        guard let key = line.localizableKey else { continue }
        keys.insert(key)
    }
    return Array(keys)
}
