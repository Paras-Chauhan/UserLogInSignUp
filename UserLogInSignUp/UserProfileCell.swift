

import UIKit

class UserProfileCell: UITableViewCell {
    //MARK:- OUTLETS 
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var optionsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
