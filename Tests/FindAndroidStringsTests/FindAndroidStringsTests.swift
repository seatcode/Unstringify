import XCTest
import CLITestFramework

final class FindAndroidStringsTests: XCTestCase {
    func testUsage() throws {
        let output = try execute(product: "findAndroidStrings")
        XCTAssertTrue(output.hasPrefix("\nUsage: "))
        XCTAssertTrue(output.hasSuffix("/findAndroidStrings localizable_strings_path android_project_root_path csv_output_path [excluded_file]\n\n"))
    }

    static var allTests = [
        ("testUsage", testUsage),
    ]
}
