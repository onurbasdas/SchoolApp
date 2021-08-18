import UIKit

class SegmentedViewController: UIViewController {
    
    @IBOutlet weak var attendanceHolidayControl: UISegmentedControl!
    @IBOutlet weak var attendanceContainer: UIView!
    @IBOutlet weak var holidayContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        conf()
    }
    
    func conf() {
        attendanceContainer.alpha = 1
        holidayContainer.alpha = 0
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "darkBlue")]
        attendanceHolidayControl.setTitleTextAttributes(titleTextAttributes as [NSAttributedString.Key : Any], for: .selected)
        
    }
    
    
    @IBAction func attendanceHolidaySwitch(_ sender: Any) {
        switch attendanceHolidayControl.selectedSegmentIndex{
        case 0:
            attendanceContainer.alpha = 1
            holidayContainer.alpha = 0
            print(0)
            break
        case 1:
            attendanceContainer.alpha = 0
            holidayContainer.alpha = 1
            print(1)
            break
        default:
            break
        }
    }
}
