import UIKit

// MARK: - View View Controller
class InputCurrency: UIViewController {
    
    // variable declaration
    @IBOutlet var flagCountries: UILabel!
    @IBOutlet var nameCountries: UILabel!
    @IBOutlet var codeCountries: UILabel!
    @IBOutlet var currencyCountries: UITextField!
    
    var arrayCodeCountries = [String]()
    var arrayCurrencyCountries = [Double]()
    
    var flag: String = ""
    var name: String = ""
    var code: String = ""
    var currency: String = ""
    
    var currencyLast: Double = 0.0
    var currencyNew: Double = 0.0
    
    var usd: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDoneButtonOnKeyboard()
        
        currencyCountries.becomeFirstResponder()
        
        // assign variables values ​​from memory
        if UserDefaults.standard.object(forKey: "flagCountries") != nil {
            flag = UserDefaults.standard.object(forKey: "flagCountries") as? String ?? ""
        }
        if UserDefaults.standard.object(forKey: "nameCountries") != nil {
            name = UserDefaults.standard.object(forKey: "nameCountries") as? String ?? ""
        }
        if UserDefaults.standard.object(forKey: "codeCountries") != nil {
            code = UserDefaults.standard.object(forKey: "codeCountries") as? String ?? ""
        }
        if UserDefaults.standard.object(forKey: "currencyCountries") != nil {
            currency = UserDefaults.standard.object(forKey: "currencyCountries") as? String ?? ""
        }
        
        if UserDefaults.standard.object(forKey: "code") != nil {
            arrayCodeCountries = UserDefaults.standard.object(forKey: "code") as? [String] ?? []
        }
        if UserDefaults.standard.object(forKey: "currency") != nil {
            arrayCurrencyCountries = UserDefaults.standard.object(forKey: "currency") as? [Double] ?? []
        }
        
        flagCountries.text = flag
        nameCountries.text = name
        codeCountries.text = code
        currencyCountries.placeholder = currency
        
        // we form the value of the currency, in relation to the dollar
        var i = 0
        for _ in arrayCodeCountries {
            if code == arrayCodeCountries[i] {
                currencyLast = arrayCurrencyCountries[i]
            } else {
                i += 1
            }
        }
    }
    
    // MARK: - Function that generates the "ok" button on the keyboard
    func addDoneButtonOnKeyboard() {
        
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "ok", style: .done, target: self, action: #selector(self.doneButtonAction))
        done.tintColor = .orange
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        currencyCountries.inputAccessoryView = doneToolbar
    }
    
    // MARK: - Function that sets the action for the "OK" button on the keyboard
    @objc func doneButtonAction() {
        
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NavigationController") as! NavigationController
        self.present(loginVC, animated: true, completion: nil)
        
        currencyCountries.resignFirstResponder()
        
        currencyNew = Double(currencyCountries.text ?? "") ?? 0.0
        usd = currencyNew / currencyLast
        
        UserDefaults.standard.setValue(usd, forKey: "usd")
    }
}
