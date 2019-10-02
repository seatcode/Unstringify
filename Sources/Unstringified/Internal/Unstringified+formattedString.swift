import Foundation

extension Unstringified {
    var formattedString: String {
        let format = localizedString
        assert(Mirror(reflecting: self).children.first?.label != nil, "Use `plainString` for unparameterized strings.")
        assert(Mirror(reflecting: self).children.count == 1, "Mirrors for enum cases with associated values were assumed to have one single child.")
        let arguments = Mirror(reflecting: self).children.flatMap { enumCaseMirrorChild -> [CVarArg] in
            if let argument = enumCaseMirrorChild.value as? CVarArg {
                return [argument]
            } else {
                let associatedValuesMirror = Mirror(reflecting: enumCaseMirrorChild.value)
                return associatedValuesMirror.children.compactMap { associatedValueMirrorChild in
                    return associatedValueMirrorChild.value as? CVarArg ?? String(describing: associatedValueMirrorChild.value)
                }
            }
        }
        assert(isRunningTests || arguments.count == format.replacingOccurrences(of: "%%", with: "").countOccurrences(of: "%"),
               """
                Arguments count doesn´t match with the required format for '\(key)' (\(arguments.count) arguments,
                expected \(format.replacingOccurrences(of: "%%", with: "").countOccurrences(of: "%"))).
               """)
        return String(format: format, arguments: arguments)
    }
}
