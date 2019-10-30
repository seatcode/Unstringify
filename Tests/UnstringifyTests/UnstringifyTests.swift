import CLITestFramework
import XCTest

final class UnstringifyTests: XCTestCase {
    func testUsage() throws {
        let output = try execute(product: "unstringify")
        XCTAssertTrue(output.hasPrefix("\nUsage: "))
        XCTAssertTrue(output.hasSuffix("/unstringify inputPath outputPath [templatePath]\n\n"))
    }

    static var allTests = [
        ("testUsage", testUsage)
    ]
}
