import class Foundation.Bundle
import XCTest

extension XCTestCase {
    public func execute(product: String) throws -> String {
        guard #available(macOS 10.13, *) else {
            fatalError("Some of the APIs that we use in the test are available in macOS 10.13 and above.")
        }

        let fooBinary = productsDirectory.appendingPathComponent(product)

        let process = Process()
        process.executableURL = fooBinary

        let pipe = Pipe()
        process.standardOutput = pipe

        try process.run()
        process.waitUntilExit()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        guard let output = String(data: data, encoding: .utf8) else { fatalError("output cannot be nil") }

        return output
    }
}
