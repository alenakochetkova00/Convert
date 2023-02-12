
import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet var flagCountries: UILabel!
    @IBOutlet var nameCountries: UILabel!
    @IBOutlet var codeCountries: UILabel!
    @IBOutlet var currencyCountries: UILabel!
    @IBOutlet var backgroundCurrency: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundCurrency.layer.cornerRadius = 10
        currencyCountries.superview?.bringSubviewToFront(currencyCountries)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        UserDefaults.standard.setValue(flagCountries.text, forKey: "flagCountries")
        UserDefaults.standard.setValue(nameCountries.text, forKey: "nameCountries")
        UserDefaults.standard.setValue(codeCountries.text, forKey: "codeCountries")
        UserDefaults.standard.setValue(String(currencyCountries.text!), forKey: "currencyCountries")
    
    }
}
