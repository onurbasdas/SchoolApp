import UIKit

class SegmentedViewController: UIViewController {
    
    @IBOutlet weak var attendanceHolidayControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        attendanceContainer.alpha = 1
        holidayContainer.alpha = 0
    }
    @IBOutlet weak var attendanceContainer: UIView!
    @IBOutlet weak var holidayContainer: UIView!
    
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
