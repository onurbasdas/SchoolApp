import UIKit

class SchoolMenuCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SchoolMenuCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "SchoolMenuCollectionViewCell", bundle: nil)
    }

    @IBOutlet weak var menuItemLabel: UILabel!
    @IBOutlet weak var menuItemImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
