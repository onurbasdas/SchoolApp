
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
    func checkPasswords() {
        if newPasswordText.text == confirmPasswordText.text {
            newPasswordText.backgroundColor = .green
            confirmPasswordText.backgroundColor = .green
        }
        else{
            newPasswordText.backgroundColor = .red
            confirmPasswordText.backgroundColor = .red
        }
    }
    @IBAction func newPasswordChanged(_ sender: Any) {
        checkPasswords()
    }
    @IBAction func confirmPasswordChanged(_ sender: Any) {
        checkPasswords()
    }
}

