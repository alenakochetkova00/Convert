import UIKit

class AdditionalTableViewCell: UITableViewCell {
    
    // variable declaration
    @IBOutlet var flagCountries: UILabel!
    @IBOutlet var nameCountries: UILabel!
    @IBOutlet var codeCountries: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
