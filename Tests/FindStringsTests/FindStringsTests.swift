import XCTest
import CLITestFramework

final class FindStringsTests: XCTestCase {
    func testUsage() throws {
        let output = try execute(product: "findStrings")
        XCTAssertTrue(output.hasPrefix("\nUsage: "))
        XCTAssertTrue(output.hasSuffix("/findStrings root_path localizable_path output_path [excluded_file]\n\n"))
    }

    static var allTests = [
        ("testUsage", testUsage),
    ]
}
