import XCTest
import Unstringified

final class UnstringifiedTests: XCTestCase {
    private final class _Foo {}

    private enum Foo: String, Unstringified {
        typealias StringType = String

        case foo

        var localizableStringsTableName: String? { return nil }

        var localizableStringsBundle: Bundle? { return Bundle(for: _Foo.self) }
    }

    func testString() throws {
        XCTAssertEqual(Foo.foo.string, "foo")
    }

    func testUppercased() throws {
        XCTAssertEqual(Foo.foo.uppercased, "FOO")
    }

    static var allTests = [
        ("testString", testString),
        ("testUppercased", testUppercased),
    ]
}
