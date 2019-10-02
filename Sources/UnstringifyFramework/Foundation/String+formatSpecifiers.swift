import Foundation

extension String {
    public func formatSpecifiers() throws -> [String] {
        // Regex pattern for format specifiers (`% flags width .precision size type`):
        //
        // - mark: %
        // - flags: %(-|\\+|0| |#)*
        // - width: (\\*|[1-9]+){0,1}
        // - size: (hh|h|l|L|ll|t|w|z|I|I32|I64){0,1}
        // - position: ([0-9]\\$){0,1}
        // - type: (@|c|C|d|i|o|u|x|X|e|E|f|F|g|G|a|a|n|p|s|S|Z)"
        //
        // The regex should match most supported format specifiers and some others unsupported or malformed.
        //
        // See https://docs.microsoft.com/en-us/cpp/c-runtime-library/format-specification-syntax-printf-and-wprintf-functions?view=vs-2017#flags
        // See https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Strings/Articles/formatSpecifiers.html
        let pattern = "%(-|\\+|0| |#)*(\\*|[1-9]+){0,1}(\\.[0-9]+){0,1}(hh|h|l|L|ll|t|w|z|I|I32|I64){0,1}([0-9]\\$){0,1}(@|c|C|d|i|o|u|x|X|e|E|f|F|g|G|a|a|n|p|s|S|Z)"

        return try matches(regex: pattern)
    }
}
