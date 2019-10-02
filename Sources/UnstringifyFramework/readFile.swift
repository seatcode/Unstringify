import Foundation

public func readFile(at path: String) throws -> String {
    let fileURL = URL(fileURLWithPath: path)
    return try String(contentsOf: fileURL)
}
