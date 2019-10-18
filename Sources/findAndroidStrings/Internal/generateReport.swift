import Foundation
import UnstringifyFramework

func generateReport(files: [String], keys: [String], outputPath: String, excludedFile: String) throws {
    var matches = [String: [String]]()
    for filePath in files where !filePath.hasSuffix(excludedFile) {
        let contents = try readFile(at: filePath)
        for key in keys {
            if contents.range(of: "@string/\(key)") != nil || contents.range(of: "R.string.\(key)") != nil {
                var matchesForKey = matches[key] ?? []
                matchesForKey.append(filePath)
                matches[key] = matchesForKey
            } else {
                matches[key] = matches[key] ?? []
            }
        }
    }
    let csv = matches.reduce(["Keys;File\n"]) { $0 + ["\"\($1.key)\"; \($1.value.map { "\($0)" }.joined(separator: "; "))"] }.joined(separator: "\n")
    let data = csv.data(using: String.Encoding.utf8, allowLossyConversion: false)
    FileManager.default.createFile(atPath: outputPath, contents: data, attributes: nil)
}
