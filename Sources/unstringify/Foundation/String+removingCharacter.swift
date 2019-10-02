import Foundation

extension String {
    func removingCharacter(at position: UInt) -> String {
        var string = self
        let index = string.index(string.startIndex, offsetBy: Int(position))
        string.remove(at: index)
        return string
    }
}
