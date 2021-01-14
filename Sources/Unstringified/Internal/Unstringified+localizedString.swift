import Foundation

extension Unstringified {
    var localizedString: String {
        guard !isRunningTests else {
            return key
        }
        let tableName = localizableStringsTableName
        let localizedString = NSLocalizedString(key, tableName: tableName, bundle: localizableStringsBundle, comment: "")
        if localizedString == key {
            return NSLocalizedString(key, tableName: tableName, comment: "")
        }
        return localizedString
    }
}
