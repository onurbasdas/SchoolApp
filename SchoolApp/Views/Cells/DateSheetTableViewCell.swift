import UIKit

class DateSheetTableViewCell: UITableViewCell {
    
    static let identifier = "DateSheetTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "DateSheetTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userIDLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var isCompletedLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        borderView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
