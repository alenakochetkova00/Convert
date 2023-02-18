
import UIKit

class MainTableViewCell: UITableViewCell {
    
    // variable declaration
    @IBOutlet var flagCountries: UILabel!
    @IBOutlet var nameCountries: UILabel!
    @IBOutlet var codeCountries: UILabel!
    @IBOutlet var currencyCountries: UILabel!
    @IBOutlet var backgroundCurrency: UIView!
    @IBOutlet var symbolCurrency: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // set the parameters for the background when displaying the currency
        backgroundCurrency.layer.cornerRadius = 10
        currencyCountries.superview?.bringSubviewToFront(currencyCountries)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // store the value of the cell that the user clicked on
        UserDefaults.standard.setValue(flagCountries.text, forKey: "flagCountries")
        UserDefaults.standard.setValue(nameCountries.text, forKey: "nameCountries")
        UserDefaults.standard.setValue(codeCountries.text, forKey: "codeCountries")
        UserDefaults.standard.setValue(String(currencyCountries.text!), forKey: "currencyCountries")
        
    }
}
