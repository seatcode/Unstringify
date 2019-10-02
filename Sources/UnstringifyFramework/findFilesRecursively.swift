import Foundation

public func findFilesRecursively(rootPath: String, extensions: [String], fileManager: FileManager = FileManager.default) throws -> [String] {
    let directoryPath = rootPath
        .appending("/\n")
        .replacingOccurrences(of: "//\n", with: "/")
        .replacingOccurrences(of: "/\n", with: "/")
    let enumerator = fileManager.enumerator(atPath: directoryPath)
    var filePaths = Set<String>()
    while let filePath = enumerator?.nextObject() as? String {
        if extensions.contains(URL(fileURLWithPath: filePath).pathExtension) {
            filePaths.insert(directoryPath.appending(filePath))
        }
    }
    return Array(filePaths)
}
