import Foundation

extension Unstringified {
    var key: String {
        String(describing: self).components(separatedBy: "(")[0]
    }
}
