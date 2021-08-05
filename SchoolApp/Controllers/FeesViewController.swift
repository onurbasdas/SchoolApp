import UIKit

class FeesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func paynowClick(_ sender: Any) {
        performSegue(withIdentifier: "PayOnlineSegue", sender: nil)
    }
    
}
