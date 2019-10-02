import Foundation

func generateKeys(localizablePath: String) throws -> Keys {
    let content = try readFile(at: localizablePath)
    return try parseKeys(content)
}

private func readFile(at path: String) throws -> String {
    let fileURL = URL(fileURLWithPath: path)
    return try String(contentsOf: fileURL)
}
