import UIKit
import Commons

class ViewController: UIViewController {
    @IBOutlet weak var formTitle: UILabel?
    @IBOutlet weak var fieldName: UILabel?
    @IBOutlet weak var fieldDescription: UILabel?
    @IBOutlet weak var fieldLimit: UILabel?
    @IBOutlet weak var input: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        formTitle?.text = Text.form_title.string
        fieldName?.text = Text.form_name_field.string
        fieldDescription?.attributedText = RichText.form_name_field_description.string
        fieldLimit?.text = Format.form_name_field_max_length(100).string
    }
}
