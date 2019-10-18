import XCTest
@testable import MainBundleExample

class MainBundleExampleTests: XCTestCase {
    func test() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateInitialViewController() as? ViewController
        _ = controller?.view
        XCTAssertEqual(controller?.formTitle?.text, "form_title")
        XCTAssertEqual(controller?.fieldName?.text, "form_name_field")
        XCTAssertEqual(controller?.fieldDescription?.text, "form_name_field_description")
        XCTAssertEqual(controller?.fieldLimit?.text, "form_name_field_max_length")
    }
}
