import UIKit
import FSCalendar

class AttendanceViewController: UIViewController, FSCalendarDelegate,FSCalendarDataSource {
    
    @IBOutlet weak var calendar: FSCalendar!
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.appearance.titleDefaultColor = .black
        calendar.allowsMultipleSelection = true
    }
    
    
    
}
