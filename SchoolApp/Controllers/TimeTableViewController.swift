import UIKit

class TimeTableViewController: UIViewController {
    
    @IBOutlet weak var userSegmentedControl: UISegmentedControl!
    @IBOutlet weak var user1View: UIView!
    @IBOutlet weak var user2View: UIView!
    @IBOutlet weak var user3View: UIView!
    @IBOutlet weak var user4View: UIView!
    @IBOutlet weak var user5View: UIView!
    
    var views = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        views.append(user1View)
        views.append(user2View)
        views.append(user3View)
        views.append(user4View)
        views.append(user5View)
        hideOtherViews(view: user1View)
    }
    
    @IBAction func userSwitch(_ sender: Any) {
        switch userSegmentedControl.selectedSegmentIndex {
        case 0:
            hideOtherViews(view: user1View)
            break;
        case 1:
            hideOtherViews(view: user2View)
            break;
        case 2:
            hideOtherViews(view: user3View)
            break;
        case 3:
            hideOtherViews(view: user4View)
            break;
        case 4:
            hideOtherViews(view: user5View)
            break;
        default:
            break;
        }
    }
    
    
    func hideOtherViews(view:UIView) {
        for e in views {
            if e==view{
                e.isHidden = false
            }
            else {
                e.isHidden = true
            }
        }
    }
}

class FirstTimeTableContainer: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var firstTableView: UITableView!
    var posts1 = [TimeTablePost]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TimeTableContainer.getTimeTable(number: 1) { [self] result in
            posts1.append(contentsOf: result!)
            firstTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let e = posts1[indexPath.row]
        cell.textLabel?.text = String(e.userId) + ": " + e.title
        return cell
    }
}

class SecondTimeTableContainer: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var secondTableView: UITableView!
    var posts2 = [TimeTablePost]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TimeTableContainer.getTimeTable(number: 2) { [self] result in
            posts2.append(contentsOf: result!)
            secondTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts2.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let e = posts2[indexPath.row]
        cell.textLabel?.text = String(e.userId) + ": " + e.title
        return cell
    }
}

class ThirdTimeTableContainer: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var thirdTableView: UITableView!
    var posts3 = [TimeTablePost]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TimeTableContainer.getTimeTable(number: 3) { [self] result in
            posts3.append(contentsOf: result!)
            thirdTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts3.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let e = posts3[indexPath.row]
        cell.textLabel?.text = String(e.userId) + ": " + e.title
        return cell
    }
}

class FourthTimeTableContainer: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var fourthTableView: UITableView!
    var posts4 = [TimeTablePost]()
    override func viewDidLoad() {
        super.viewDidLoad()
        TimeTableContainer.getTimeTable(number: 4) { [self] result in
            posts4.append(contentsOf: result!)
            fourthTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts4.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let e = posts4[indexPath.row]
        cell.textLabel?.text = String(e.userId) + ": " + e.title
        return cell
    }
}

class FifthTimeTableContainer: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var fifthTableView: UITableView!
    var posts5 = [TimeTablePost]()
    override func viewDidLoad() {
        super.viewDidLoad()
        TimeTableContainer.getTimeTable(number: 5) { [self] result in
            posts5.append(contentsOf: result!)
            fifthTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts5.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let e = posts5[indexPath.row]
        cell.textLabel?.text = String(e.userId) + ": " + e.title
        return cell
    }
}

class TimeTableContainer {
    static func getTimeTable(number: Int,completion: @escaping ([TimeTablePost]?) -> Void) {
        var filteredPosts = [TimeTablePost]()
        DispatchQueue.main.async {
            Service.getTimeTablePosts { result in
                for post in result{
                    if post.userId == number{
                        filteredPosts.append(post)
                        completion(filteredPosts)
                    }
                }
            }
        }
    }
}
