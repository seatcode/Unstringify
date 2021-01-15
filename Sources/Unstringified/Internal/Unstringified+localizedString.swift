import Foundation

extension Unstringified {
    var localizedString: String {
        guard !isRunningTests else {
            return key
        }
        let mainBundleString = NSLocalizedString(key, tableName: localizableStringsTableName, comment: "")
        guard let localizableStringsBundle = localizableStringsBundle else {
            return mainBundleString
        }
        let localizedString = NSLocalizedString(key, tableName: localizableStringsTableName, bundle: localizableStringsBundle, comment: "")
        return mainBundleString == key ? localizedString : mainBundleString
    }
}
