import Foundation

struct FormatKey: CustomStringConvertible {
    let key: String
    let specifiers: [String]

    var description: String {
        let params = specifiers.map { specifier in
            return "_: \(typeName(for: specifier))"
        }
        return "\(key)(\(params.joined(separator: ", ")))"
    }

    func typeName(for formatSpecifier: String) -> String {
        // https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Strings/Articles/formatSpecifiers.html
        guard let lastCharacter = formatSpecifier.last else {
            return "Any"
        }
        let type = String(lastCharacter)
        switch type {
        case "@": return "CustomStringConvertible"
        case "d", "D": return "Int"
        case "u", "U": return "UInt"
        case "x", "X": return "UInt"
        case "o", "O": return "UInt"
        case "f": return "Double"
        case "e", "E": return "Double"
        case "g", "G": return "Double"
        case "c": return "CUnsignedChar"
        case "C": return "unichar"
        case "s": return "UnsafePointer<CChar>"
        case "S": return "UnsafePointer<unichar>"
        case "p": return "UnsafePointer<Void>"
        case "a", "A": return "Double"
        case "F": return "Double"
        default: return "Any"
        }
    }
}
