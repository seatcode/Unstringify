import Foundation

typealias Keys = (standard: [String], formatted: [FormatKey], rich: [String], richFormatted: [FormatKey])

func parseKeys(_ content: String) throws -> Keys {
    let keyValueLines = content.components(separatedBy: "\n").filter { $0.isKeyValueLine }.filter { !$0.isInfoPlistValueLine }

    var standardKeys: [String] = []
    var formattedKeys: [FormatKey] = []
    var richKeys: [String] = []
    var richFormattedKeys: [FormatKey] = []

    for line in keyValueLines {
        guard let key = line.localizableKey else { continue }
        let formatSpecifiers = try line.formatSpecifiers()
        if formatSpecifiers.isEmpty {
            if try line.containsHTML() {
                richKeys.append(key)
            } else {
                standardKeys.append(key)
            }
        } else {
            if try line.containsHTML() {
                richFormattedKeys.append(FormatKey(key: key, specifiers: formatSpecifiers))
            } else {
                formattedKeys.append(FormatKey(key: key, specifiers: formatSpecifiers))
            }
        }
    }

    if standardKeys.isEmpty {
        standardKeys.append("👻")
    }
    if formattedKeys.isEmpty {
        formattedKeys.append(FormatKey(key: "👻", specifiers: []))
    }
    if richKeys.isEmpty {
        richKeys.append("👻")
    }
    if richFormattedKeys.isEmpty {
        richFormattedKeys.append(FormatKey(key: "👻", specifiers: []))
    }

    return Keys(standard: standardKeys,
                formatted: formattedKeys,
                rich: richKeys,
                richFormatted: richFormattedKeys)
}
