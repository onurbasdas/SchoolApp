import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var showPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailInput.addBottomBorder()
        passwordInput.addBottomBorder()
        showPasswordButton.tintColor = UIColor(named: "darkBlue")
        showPasswordButton.setImage(UIImage(systemName: "eye.fill"),for: .normal)
    }
    
    @IBAction func signIn(_ sender: Any) {
        if emailInput.text == "111" && passwordInput.text == "111"{
            performSegue(withIdentifier: "SignInSegue", sender: nil)
        }
        else{
            makeAlert(titleInput: "Giriş Başarısız", messageInput: "Lütfen tekrar deneyin")
        }
    }
    
    @IBAction func toggleShowPassword(_ sender: Any) {
        passwordInput.isSecureTextEntry = !passwordInput.isSecureTextEntry
        if passwordInput.isSecureTextEntry {
            showPasswordButton.setImage(UIImage(systemName: "eye.fill"),for: .normal)
        }
        else{
            showPasswordButton.setImage(UIImage(systemName: "eye"),for: .normal)
        }
        print("fsdfds")
    }
    
    
}

