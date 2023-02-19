import UIKit

// MARK: - View View Controller
class MainViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    // enter all variables
    var flag = [String]()
    var name = [String]()
    var codes = [String]()
    var currency = [Double]()
    
    var usd: Double = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set table view color
        self.tableView.backgroundColor = UIColor.white
        
        // if there is no internet, display alert and close the program
        if NetworkMonitor.shared.isConnected {
            print("connected")
        } else {
            
            navigationController?.setNavigationBarHidden(true, animated: true)
            tableView.isHidden = true
            let alert = UIAlertController(title: "ooops...", message: ("no internet connection"), preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: { action in
                UIControl().sendAction(#selector(NSXPCConnection.suspend),
                                       to: UIApplication.shared, for: nil)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        
        setupNavigationBar()
        dataStorage()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    
// MARK: - Visual rendering of the Navigation Bar
    func setupNavigationBar() {
        
        navigationController!.navigationBar.tintColor = UIColor.orange
        
        let navBarApperance = UINavigationBarAppearance()
        navBarApperance.configureWithOpaqueBackground()
        navBarApperance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navBarApperance.largeTitleTextAttributes = [.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "Futura Bold", size: 25), size: 25)]
        
        navBarApperance.backgroundColor = UIColor(red: 225/225, green: 225/225, blue: 225/225, alpha: 225/225)
        
        navigationController?.navigationBar.standardAppearance = navBarApperance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarApperance
    }
    
    
// MARK: - Assigning Data to variables from Memory
    func dataStorage() {
        if UserDefaults.standard.object(forKey: "flag") != nil {
            flag = UserDefaults.standard.object(forKey: "flag") as? [String] ?? []
        }
        if UserDefaults.standard.object(forKey: "name") != nil {
            name = UserDefaults.standard.object(forKey: "name") as? [String] ?? []
        }
        if UserDefaults.standard.object(forKey: "code") != nil {
            codes = UserDefaults.standard.object(forKey: "code") as? [String] ?? []
        }
        if UserDefaults.standard.object(forKey: "currency") != nil {
            currency = UserDefaults.standard.object(forKey: "currency") as? [Double] ?? []
        }
        if UserDefaults.standard.object(forKey: "usd") != nil {
            usd = UserDefaults.standard.object(forKey: "usd") as? Double ?? 1.0
        }
    }
}


// MARK: - Table View Controller (value output)
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    // cell width
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    // number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flag.count
    }
    
    // cell filling
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOnMainScreen", for: indexPath) as! MainTableViewCell
        
        // getting the currency symbol
        func getSymbolForCurrencyCode(code: String) -> String {
            var candidates: [String] = []
            let locales: [String] = NSLocale.availableLocaleIdentifiers
            for localeID in locales {
                guard let symbol = findMatchingSymbol(localeID: localeID, currencyCode: code) else {
                    continue
                }
                if symbol.count == 1 {
                    return symbol
                }
                candidates.append(symbol)
            }
            let sorted = sortAscByLength(list: candidates)
            if sorted.count < 1 {
                return ""
            }
            return sorted[0]
        }

        func findMatchingSymbol(localeID: String, currencyCode: String) -> String? {
            let locale = Locale(identifier: localeID as String)
            guard let code = locale.currencyCode else {
                return nil
            }
            if code != currencyCode {
                return nil
            }
            guard let symbol = locale.currencySymbol else {
                return nil
            }
            return symbol
        }

        func sortAscByLength(list: [String]) -> [String] {
            return list.sorted(by: { $0.count < $1.count })
        }
        
        // set the currency output format
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        formatter.decimalSeparator = ","
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        // fill cells with data
        cell.flagCountries.text = flag[indexPath.row] 
        cell.nameCountries.text = name[indexPath.row]
        cell.codeCountries.text = codes[indexPath.row]
        cell.currencyCountries.text = formatter.string(for: Float32(currency[indexPath.row] * usd))
        cell.symbolCurrency.text = getSymbolForCurrencyCode(code: codes[indexPath.row])
        
        return cell
    }
    
    // when clicking on a cell, the background does not stick
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // removing data from a TableView
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            flag.remove(at: indexPath.row)
            name.remove(at: indexPath.row)
            codes.remove(at: indexPath.row)
            currency.remove(at: indexPath.row)
            
            UserDefaults.standard.setValue(flag, forKey: "flag")
            UserDefaults.standard.setValue(name, forKey: "name")
            UserDefaults.standard.setValue(codes, forKey: "code")
            UserDefaults.standard.setValue(currency, forKey: "currency")
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
        }
    }
}


