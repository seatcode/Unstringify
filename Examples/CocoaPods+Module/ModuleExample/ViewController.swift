import Commons
import UIKit

class ViewController: UIViewController {
    @IBOutlet var formTitle: UILabel?
    @IBOutlet var fieldName: UILabel?
    @IBOutlet var fieldDescription: UILabel?
    @IBOutlet var fieldLimit: UILabel?
    @IBOutlet var input: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        formTitle?.text = String.Text.form_title.string
        fieldName?.text = String.Text.form_name_field.string
        fieldDescription?.attributedText = RichText.form_name_field_description.string
        fieldLimit?.text = Format.form_name_field_max_length(100).string
    }
}
