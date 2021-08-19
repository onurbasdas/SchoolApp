import UIKit

class RickAndMortyTableViewCell: UITableViewCell {


    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    
    static let identifier = "RickAndMortyTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "RickAndMortyTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
