
import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet var flagCountries: UILabel!
    @IBOutlet var nameCountries: UILabel!
    @IBOutlet var codeCountries: UILabel!
    @IBOutlet var currencyCountries: UITextField!
    
    var codeMeaning = [String]()
    var currencyMeaning = [Double]()
    
    var flag: String = ""
    var name: String = ""
    var code: String = ""
    var currency: Double = 0.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dataStorage()
//        addDoneButtonOnKeyboard()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func dataStorage() {
        if UserDefaults.standard.object(forKey: "code") != nil {
            codeMeaning = UserDefaults.standard.object(forKey: "code") as? [String] ?? []
        }
        if UserDefaults.standard.object(forKey: "currency") != nil {
            currencyMeaning = UserDefaults.standard.object(forKey: "currency") as? [Double] ?? []
        }
    }
}
