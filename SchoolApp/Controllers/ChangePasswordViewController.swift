
import UIKit

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var oldPasswordText: UITextField!
    @IBOutlet weak var newPasswordText: UITextField!
    @IBOutlet weak var confirmPasswordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conf()
    }
    func conf() {
        oldPasswordText.addBottomBorder()
        newPasswordText.addBottomBorder()
        confirmPasswordText.addBottomBorder()
    }
}
