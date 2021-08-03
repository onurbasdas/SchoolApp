import UIKit

class SchoolGalleryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    static let identifier = "SchoolGalleryCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "SchoolGalleryCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
