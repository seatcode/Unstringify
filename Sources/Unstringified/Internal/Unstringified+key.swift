import Foundation

extension Unstringified {
    var key: String {
        return String(describing: self).components(separatedBy: "(")[0]
    }
}
