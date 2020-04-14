import Foundation

extension Unstringified where Self: RawRepresentable, Self.RawValue == String {
    var plainString: String {
        let string = localizedString
        assert(Mirror(reflecting: self).children.first?.label == nil, "Use `formattedString` for parameterized strings.")
        // assert(String(format: string) == string, "'\(key)' contains format arguments. Use `format(...)` instead of `string`.")
        return string
    }

    private var key: String {
        rawValue
    }
}
