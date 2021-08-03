import UIKit
import FSCalendar

class HolidayViewController: UIViewController, FSCalendarDelegate,FSCalendarDataSource {
    

    @IBOutlet weak var calendar: FSCalendar!
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.allowsMultipleSelection = true
    }
    
    
}
