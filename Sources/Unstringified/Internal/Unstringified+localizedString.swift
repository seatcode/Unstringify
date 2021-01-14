import Foundation

extension Unstringified {
    var localizedString: String {
        guard !isRunningTests else {
            return key
        }
        let bundle = localizableStringsBundle ?? Bundle.module
        let tableName = localizableStringsTableName
        let localizedString = NSLocalizedString(key, tableName: tableName, bundle: bundle, comment: "")
        if localizedString == key {
            return NSLocalizedString(key, tableName: tableName, comment: "")
        }
        return localizedString
    }
}
