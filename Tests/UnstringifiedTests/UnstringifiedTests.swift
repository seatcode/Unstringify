import Unstringified
import XCTest

final class UnstringifiedTests: XCTestCase {
    private final class _Foo {}

    private enum Foo: String, Unstringified {
        typealias StringType = String

        case foo

        var localizableStringsTableName: String? { nil }

        var localizableStringsBundle: Bundle? { Bundle(for: _Foo.self) }
    }

    func testString() throws {
        XCTAssertEqual(Foo.foo.string, "foo")
    }

    func testUppercased() throws {
        XCTAssertEqual(Foo.foo.uppercased, "FOO")
    }

    static var allTests = [
        ("testString", testString),
        ("testUppercased", testUppercased)
    ]
}
