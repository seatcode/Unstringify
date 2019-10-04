import XCTest
import UnstringifyFramework

final class UnstringifyFrameworkTests: XCTestCase {
    func testParseKeys() throws {
        let content = """
// COMMENT

/*
 another
 comment
*/

"key0" = "value0";
"key1" = "value1";

"""
        let keys = try parseKeys(content)
        XCTAssertEqual(Set(keys), Set(["key0", "key1"]))
    }

    func testContainsHTML() throws {
        XCTAssertNoThrow(try "".containsHTML())
        XCTAssertFalse(try "<b>".containsHTML())
        XCTAssertFalse(try "<strong>".containsHTML())
        XCTAssertFalse(try "</em>".containsHTML())
        XCTAssertTrue(try "<b></b>".containsHTML())
        XCTAssertTrue(try "<strong>Hello</strong>".containsHTML())
        XCTAssertTrue(try "<em>1</em>".containsHTML())

    }

    func testFormatSpecifiers() throws {
        let result = try "ABC %d (%@,%f) %s%3$s 123XXX".formatSpecifiers()
        let expected = ["%d", "%@", "%f", "%s", "%3$s"]
        XCTAssertEqual(result, expected)
    }

    func testIsINfoPlistValueLine() {
        XCTAssertTrue("\"infoplist_XXX\"= \"\";".isInfoPlistValueLine)
        XCTAssertFalse("\"info_plist_XXX\"= \"\";".isInfoPlistValueLine)
    }

    func testIsKeyValueLine() {
        XCTAssertTrue("\"x\" = \"y\";".isKeyValueLine)
        XCTAssertFalse(" \"x\" = \"y\";".isKeyValueLine)
        XCTAssertFalse("//\"x\" = \"y\";".isKeyValueLine)
    }

    func testLocalizableKey() {
        let result = "\"x\" = \"y\";".localizableKey
        let expected = "x"
        XCTAssertEqual(result, expected)
    }

    func testMatches() throws {
        let result = try "1.1".matches(regex: "[:alnum:]")
        let expected = ["1", "1"]
        XCTAssertEqual(result, expected)
    }

    func testRemovingCharacterAt() {
        let result = "ABC".removingCharacter(at: 1)
        let expected = "AC"
        XCTAssertEqual(result, expected)
    }

    static var allTests = [
        ("testParseKeys", testParseKeys),
        ("testContainsHTML", testContainsHTML),
        ("testFormatSpecifiers", testFormatSpecifiers),
        ("testIsINfoPlistValueLine", testIsINfoPlistValueLine),
        ("testIsKeyValueLine", testIsKeyValueLine),
        ("testLocalizableKey", testLocalizableKey),
        ("testMatches", testMatches),
        ("testRemovingCharacterAt", testRemovingCharacterAt),
    ]
}
