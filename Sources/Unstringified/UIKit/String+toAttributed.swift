#if os(OSX)
    import AppKit
#else
    import UIKit
#endif

extension String {
    func toAttributed() -> NSAttributedString {
        let data = Data(utf8)
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue,
        ]
        guard let attributed = try? NSMutableAttributedString(data: data,
                                                              options: options,
                                                              documentAttributes: nil)
        else { return NSMutableAttributedString(string: strippingMarkup()) }
        return attributed
    }

    private func strippingMarkup() -> String {
        return replacingOccurrences(of: "<b>", with: "")
            .replacingOccurrences(of: "</b>", with: "")
            .replacingOccurrences(of: "<i>", with: "")
            .replacingOccurrences(of: "</i>", with: "")
    }
}
