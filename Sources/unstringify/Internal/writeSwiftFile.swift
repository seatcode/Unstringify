import Foundation

@discardableResult
func writeSwiftFile(_ keys: [String], _ formattedKeys: [FormatKey], _ richKeys: [String], _ richFormattedKeys: [FormatKey], outputPath: String, templatePath: String? = nil) throws -> Bool {
    let file = try template(keys: keys, formattedKeys: formattedKeys, richKeys: richKeys, richFormattedKeys: richFormattedKeys, templatePath: templatePath)
    let data = file.data(using: String.Encoding.utf8, allowLossyConversion: false)
    return FileManager.default.createFile(atPath: outputPath, contents: data, attributes: nil)
}
