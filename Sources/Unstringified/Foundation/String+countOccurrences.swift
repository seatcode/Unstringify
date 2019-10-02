import Foundation

extension String {
    func countOccurrences(of string: String) -> Int {
        guard !isEmpty else {
            return 0
        }
        return components(separatedBy: string).count - 1
    }
}
