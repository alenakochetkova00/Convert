
import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var listCurrency = [String : Double]()
    var listCurrencyName = [String]()
    var listCurrencyValue = [Double]()
    
    var flag = [String]()
    var name = [String]()
    var codes = [String]()
    var currency = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        dataStorage()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
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
    }
}


extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flag.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOnMainScreen", for: indexPath) as! MainTableViewCell
        
        cell.flagCountries.text = flag[indexPath.row]
        cell.nameCountries.text = name[indexPath.row]
        cell.codeCountries.text = codes[indexPath.row]
        cell.currencyCountries.text = String(currency[indexPath.row])
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // MARK: - Removing Data from a TableView
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
