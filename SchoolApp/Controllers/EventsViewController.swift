import UIKit
import Kingfisher

class EventsViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableRickView: UITableView!
    var rickArray = [RickAndMorty]()
    var bodyArray = [TimeTablePost]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableRickView.register(RickAndMortyTableViewCell.nib(), forCellReuseIdentifier: RickAndMortyTableViewCell.identifier)
        Service.getRickAndMortys { response in
            self.rickArray.append(contentsOf: response)
            self.tableRickView.reloadData()
        }
        Service.getTimeTablePosts { results in
            self.bodyArray.append(contentsOf: results[0...19])
            self.tableRickView.reloadData()
        } 
    }
    
}

extension EventsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bodyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableRickView.dequeueReusableCell(withIdentifier: "RickAndMortyTableViewCell") as! RickAndMortyTableViewCell
        cell.nameLabel.text = rickArray[indexPath.row].name
        cell.statusLabel.text = rickArray[indexPath.row].status
        cell.profileImage.kf.setImage(with: URL(string: rickArray[indexPath.row].image))
        cell.bodyLabel.text = bodyArray[indexPath.row].body
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 162
    }
}
