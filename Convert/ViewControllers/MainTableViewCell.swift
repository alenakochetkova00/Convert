
import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet var flagCountries: UILabel!
    @IBOutlet var nameCountries: UILabel!
    @IBOutlet var codeCountries: UILabel!
    @IBOutlet var currencyCountries: UITextField!
    
    var arrayCode = [String]()
    var arrayCurrency = [Double]()
    
    var flag: String = ""
    var name: String = ""
    var code: String = ""
    var currencyLast: Double = 0.0
    var currencyNew: Double = 0.0
    var currencyUSD: Double = 0.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addDoneButtonOnKeyboard()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func addDoneButtonOnKeyboard() {
        
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "OK", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        currencyCountries.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction(){
        currencyCountries.resignFirstResponder()
        
        if UserDefaults.standard.object(forKey: "code") != nil {
            arrayCode = UserDefaults.standard.object(forKey: "code") as? [String] ?? []
        }
        if UserDefaults.standard.object(forKey: "currency") != nil {
            arrayCurrency = UserDefaults.standard.object(forKey: "currency") as? [Double] ?? []
        }
        
        flag = flagCountries.text!
        name = nameCountries.text!
        code = codeCountries.text!
        currencyNew = Double(currencyCountries.text!)!
        
        var i = 0
        for _ in arrayCode {
            if code == arrayCode[i] {
                currencyLast = arrayCurrency[i]
            } else {
                i += 1
            }
        }
        
        currencyUSD = currencyNew/currencyLast
        
        UserDefaults.standard.setValue(currencyUSD, forKey: "USD")
        
        print(flag)
        print(name)
        print(code)
        print(currencyLast)
        print(currencyNew)
        print(currencyUSD)
    }
}
