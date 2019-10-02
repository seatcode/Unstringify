import class Foundation.Bundle
import XCTest

final class UnstringifyTests: XCTestCase {
    func testUsage() throws {
        guard #available(macOS 10.13, *) else {
            XCTFail("Some of the APIs that we use in the test are available in macOS 10.13 and above.")
            return
        }

        let fooBinary = productsDirectory.appendingPathComponent("unstringify")

        let process = Process()
        process.executableURL = fooBinary

        let pipe = Pipe()
        process.standardOutput = pipe

        try process.run()
        process.waitUntilExit()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        guard let output = String(data: data, encoding: .utf8) else { fatalError("output cannot be nil") }

        XCTAssertTrue(output.hasPrefix("Usage: "))
        XCTAssertTrue(output.hasSuffix("/unstringify inputPath outputPath\n"))
    }

    /// Returns path to the built products directory.
    var productsDirectory: URL {
        #if os(macOS)
            for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
                return bundle.bundleURL.deletingLastPathComponent()
            }
            fatalError("couldn't find the products directory")
        #else
            return Bundle.main.bundleURL
        #endif
    }

    static var allTests = [
        ("testUsage", testUsage),
    ]
}
