import Foundation

extension String {
    func matches(regex pattern: String) throws -> [String] {
        let regex = try NSRegularExpression(pattern: pattern)
        let nsString = self as NSString
        let results = regex.matches(in: self, range: NSRange(location: 0, length: nsString.length))
        return results.map { nsString.substring(with: $0.range) }
    }
}
