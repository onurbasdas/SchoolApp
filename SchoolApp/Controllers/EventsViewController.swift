import UIKit
import Kingfisher

class EventsViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableRickView: UITableView!
    var eventsArray = [EventItem]()
    var filteredEventsArray = [EventItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableRickView.register(RickAndMortyTableViewCell.nib(), forCellReuseIdentifier: RickAndMortyTableViewCell.identifier)
        Service.getRickAndMortys{ response in
            self.eventsArray.append(contentsOf: response)
            self.filteredEventsArray.append(contentsOf: response)
            self.tableRickView.reloadData()
        }
    }
    
    
}

extension EventsViewController:UISearchBarDelegate,UISearchDisplayDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredEventsArray = eventsArray.filter({$0.name.contains(searchText)})
        if searchText == "" {
            filteredEventsArray = eventsArray
        }
        tableRickView.reloadData()
    }
}

extension EventsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredEventsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableRickView.dequeueReusableCell(withIdentifier: "RickAndMortyTableViewCell") as! RickAndMortyTableViewCell
        cell.nameLabel.text = filteredEventsArray[indexPath.row].name
        cell.statusLabel.text = filteredEventsArray[indexPath.row].status
        cell.profileImage.kf.setImage(with: URL(string: filteredEventsArray[indexPath.row].image))
        cell.bodyLabel.text = filteredEventsArray[indexPath.row].body
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 162
    }
}
