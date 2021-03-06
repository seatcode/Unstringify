import Foundation

public protocol Unstringified {
    associatedtype StringType

    var string: StringType { get }
    var uppercased: StringType { get }
    var localizableStringsTableName: String? { get }
    var localizableStringsBundle: Bundle? { get }
}

extension Unstringified where Self: RawRepresentable, Self.RawValue == String, StringType == String {
    public var string: String {
        plainString
    }
}

extension Unstringified where Self: RawRepresentable, Self.RawValue == String, StringType == NSAttributedString {
    public var string: NSAttributedString {
        plainString.toAttributed()
    }
}

extension Unstringified where StringType == String {
    public var string: String {
        formattedString
    }

    public var uppercased: String {
        string.uppercased()
    }
}

extension Unstringified where StringType == NSAttributedString {
    public var string: NSAttributedString {
        formattedString.toAttributed()
    }

    public var uppercased: NSAttributedString {
        string.uppercased()
    }
}
