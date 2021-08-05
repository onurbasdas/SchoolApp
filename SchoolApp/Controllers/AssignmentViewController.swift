import UIKit

class AssignmentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var assignments = [ToDoItem]()
    
    func getData() {
        DispatchQueue.main.async {
            Service.getToDoItems { [self] result in
                assignments.append(contentsOf: result)
                tableView.reloadData()
            }
        }
    }

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(AssignmentTableViewCell.nib(), forCellReuseIdentifier: AssignmentTableViewCell.identifier)
        getData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        assignments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AssignmentTableViewCell", for: indexPath) as! AssignmentTableViewCell
        cell.titleLabel.text = assignments[indexPath.row].title
        cell.idLabel.text = String(assignments[indexPath.row].id)
        cell.userIDLabel.text = String(assignments[indexPath.row].userId)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

}
