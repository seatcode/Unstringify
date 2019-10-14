import Foundation

extension Unstringified {
    var localizedString: String {
        guard !isRunningTests else {
            return key
        }
        let bundle = localizableStringsBundle ?? Bundle.main
        let tableName = localizableStringsTableName
        return NSLocalizedString(key, tableName: tableName, bundle: bundle, comment: "")
    }
}
