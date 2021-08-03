import UIKit

class DateSheetViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var toDoItems = [ToDoItem]()
    
    
    @IBOutlet weak var dateSheetTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        dateSheetTableView.register(DateSheetTableViewCell.nib(), forCellReuseIdentifier: DateSheetTableViewCell.identifier)
        getData()
    }
    
    func getData() {
        DispatchQueue.main.async {
            Service.getToDoItems { [self] result in
                toDoItems.append(contentsOf: result)
                dateSheetTableView.reloadData()
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        toDoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dateSheetTableView.dequeueReusableCell(withIdentifier: "DateSheetTableViewCell", for: indexPath) as! DateSheetTableViewCell
        cell.titleLabel.text = toDoItems[indexPath.row].title
        cell.idLabel.text = String(toDoItems[indexPath.row].id)
        cell.userIDLabel.text = String(toDoItems[indexPath.row].userId)
        cell.isCompletedLabel.text = String(toDoItems[indexPath.row].completed)
        return cell
    }
}
