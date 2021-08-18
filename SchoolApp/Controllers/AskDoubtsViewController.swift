import UIKit
import iOSDropDown

class AskDoubtsViewController: UIViewController {

    @IBOutlet weak var selectTeacherDropdown: DropDown!
    @IBOutlet weak var selectSubjectDropdown: DropDown!
    var teacherDropdownSelected = ""
    var subjectDropdownSelected = ""
    
    @IBOutlet weak var titleInput: UITextField!
    @IBOutlet weak var doubtDescriptionInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDropdowns()
        selectTeacherDropdown.selectedRowColor = UIColor(named: "darkBlue")!
        selectSubjectDropdown.selectedRowColor = UIColor(named: "darkBlue")!
    }
    
    func configureDropdowns() {
        selectTeacherDropdown.optionArray = ["Öğretmen 1", "Öğretmen 2", "Öğretmen 3"]
        
        selectTeacherDropdown.didSelect{(selectedText , index ,id) in
            self.teacherDropdownSelected = selectedText
        }
        
        selectSubjectDropdown.optionArray = ["Ders 1", "Ders 2", "Ders 3"]
        
        selectSubjectDropdown.didSelect{(selectedText , index ,id) in
            self.subjectDropdownSelected = selectedText
        }
    }
    @IBAction func sendDoubt(_ sender: Any) {
        print("Teacher: \(teacherDropdownSelected)")
        print("Subject: \(subjectDropdownSelected)")
        print("Title: \(titleInput.text!)")
        print("Description: \(doubtDescriptionInput.text!)")
    }
}
