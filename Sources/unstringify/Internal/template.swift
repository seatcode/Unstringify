import Foundation

// swiftlint:disable:next function_body_length
func template(keys: [String], formattedKeys: [FormatKey], richKeys: [String], richFormattedKeys: [FormatKey]) -> String {
    let file: String =
        """
            // Generated by Unstringify.
            // DO NOT EDIT!

            import Foundation
            import Unstringified

            private final class _Unstringified {}

            extension Unstringified {
            \tpublic var localizableStringsTableName: String? {
            \t\treturn nil
            \t}

            \tpublic var localizableStringsBundle: Bundle? {
            \t\tlet _UnstringifiedBundle = Bundle(for: _Unstringified.self)
            \t\tguard _UnstringifiedBundle.bundleIdentifier != Bundle.main.bundleIdentifier else {
            \t\t\treturn Bundle.main
            \t\t}
            \t\tlet bundleURL = _UnstringifiedBundle.bundleURL
            \t\tlet bundleName = bundleURL.lastPathComponent
            \t\tlet resource = (bundleName as NSString).deletingPathExtension
            \t\tguard let path = _UnstringifiedBundle.path(forResource: resource, ofType: "bundle") else {
            \t\t\treturn nil
            \t\t}
            \t\treturn Bundle(path: path)
            \t}
            }

            public enum Text: String, Unstringified {
            \tpublic typealias StringType = String
            \tcase \(keys.joined(separator: ", "))
            }

            public enum Format: Unstringified {
            \tpublic typealias StringType = String
            \tcase \(formattedKeys.map { $0.description }.joined(separator: ", "))
            }

            public enum RichText: String, Unstringified {
            \tpublic typealias StringType = NSAttributedString
            \tcase \(richKeys.joined(separator: ", "))
            }

            public enum RichFormat: Unstringified {
            \tpublic typealias StringType = NSAttributedString
            \tcase \(richFormattedKeys.map { $0.description }.joined(separator: ", "))
            }

            """.replacingOccurrences(of: "\t", with: "    ")
    return file
}
