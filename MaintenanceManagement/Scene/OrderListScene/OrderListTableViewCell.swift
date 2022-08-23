import UIKit

class OrderListTableViewCell: UITableViewCell {
    static var filename: String {
        return String(describing: self)
    }
    static var nib: UINib {
        return UINib(nibName: filename, bundle: nil)
    }
    static var cell: String {
        return "orderListCell"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
