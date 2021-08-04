import UIKit

class AssignmentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userIDLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet var checkButton: UIButton!
    
    
    
    static let identifier = "AssignmentTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "AssignmentTableViewCell", bundle: nil)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        borderView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        titleLabel.numberOfLines = 0
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func checkButtonClicked(_ sender: Any) {
        checkButton.backgroundColor = .green
        //sayfada butona tıklandığında komple renk değiştiriyor.
    }
    
}
