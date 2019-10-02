import Foundation

extension Unstringified {
    var localizedString: String {
        guard !isRunningTests else {
            return key
        }
        let _UncrustifiedBundle = localizableStringsBundle
        let bundleURL = _UncrustifiedBundle.bundleURL
        let bundleName = bundleURL.lastPathComponent
        let resource = (bundleName as NSString).deletingPathExtension
        guard let path = _UncrustifiedBundle.path(forResource: resource, ofType: "bundle") else {
            return key
        }
        guard let bundle = Bundle(path: path) else {
            return key
        }
        return NSLocalizedString(key, bundle: bundle, comment: "")
    }
}
