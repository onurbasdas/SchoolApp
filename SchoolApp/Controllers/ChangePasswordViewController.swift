
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
            newPasswordText.addColoredBottomBorder(color: .green)
            confirmPasswordText.addColoredBottomBorder(color: .green)
        }
        else{
            //newPasswordText.backgroundColor = .red
            //confirmPasswordText.backgroundColor = .red
            newPasswordText.addColoredBottomBorder(color: .red)
            confirmPasswordText.addColoredBottomBorder(color: .red)
        }
    }
    @IBAction func newPasswordChanged(_ sender: Any) {
        checkPasswords()
    }
    @IBAction func confirmPasswordChanged(_ sender: Any) {
        checkPasswords()
    }
    @IBAction func changePasswordClick(_ sender: Any) {
        makeAlert(titleInput: "Şifre Değişimi", messageInput: "İşlem başarıyla tamamlandı")
    }
}

