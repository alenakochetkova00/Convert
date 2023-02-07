
import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var editButton: UIBarButtonItem!
    @IBOutlet var currencyText: UILabel!
    
    var listCurrency = [String : Double]()
    var listCurrencyName = [String]()
    var listCurrencyValue = [Double]()
    
    var flag = [String]()
    var name = [String]()
    var codes = [String]()
    var currency = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataStorage()
        receivingData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    func dataStorage() {
        if UserDefaults.standard.object(forKey: "flag") != nil {
            flag = UserDefaults.standard.object(forKey: "flag") as! [String]
        }
        if UserDefaults.standard.object(forKey: "name") != nil {
            name = UserDefaults.standard.object(forKey: "name") as! [String]
        }
        if UserDefaults.standard.object(forKey: "code") != nil {
            codes = UserDefaults.standard.object(forKey: "code") as! [String]
        }
    }
    
    func receivingData() {
        
        let url = URL(string: "https://open.er-api.com/v6/latest/USD")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { data, response, error in
            
            if error != nil {
                print(error?.localizedDescription as Any)
                
            } else {
                
                if data != nil {
                    
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        print(jsonResponse)
                        
                        DispatchQueue.main.async { [self] in
                            
                            let array = Array(jsonResponse["rates"] as! [String : Double])
                            
                            for cod in codes {
                            for (key, value) in array {
                                
                                var entity = CurrencyConversion()
                                entity.code = key
                                entity.value = value
                                
                                if cod == key {
                                    self.listCurrencyName.append(key)
                                    self.currency.append(value)
                                
                                    }
                                }
                            }
                            
                            print(currency)
                            print(codes)
                            print(listCurrencyName)
                            self.tableView.reloadData()
                        }
                    } catch {
                        print("error")
                    }
                }
            }
        }
        task.resume()
    }
    
    
    @IBAction func editButtonClick(_ sender: Any) {
        
        tableView.isEditing = !tableView.isEditing
        if tableView.isEditing {
            editButton.title = "Ok"
        } else {
            editButton.title = "Edit"
        }
    }
}


extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currency.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOnMainScreen", for: indexPath) as! MainTableViewCell
        
        cell.flag.text = flag[indexPath.row]
        cell.nameCountries.text = name[indexPath.row]
        cell.codeCountries.text = codes[indexPath.row]
        cell.currencyValue.text = String(currency[indexPath.row])
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let selectedItemFlag = flag[sourceIndexPath.row]
        flag.remove(at: sourceIndexPath.row)
        flag.insert(selectedItemFlag, at: destinationIndexPath.row)
        
        let selectedItemName = name[sourceIndexPath.row]
        name.remove(at: sourceIndexPath.row)
        name.insert(selectedItemName, at: destinationIndexPath.row)
        
        let selectedItemCode = codes[sourceIndexPath.row]
        codes.remove(at: sourceIndexPath.row)
        codes.insert(selectedItemCode, at: destinationIndexPath.row)
        
        let selectedItemCurrency = currency[sourceIndexPath.row]
        currency.remove(at: sourceIndexPath.row)
        currency.insert(selectedItemCurrency, at: destinationIndexPath.row)
        
        UserDefaults.standard.setValue(flag, forKey: "flag")
        UserDefaults.standard.setValue(name, forKey: "name")
        UserDefaults.standard.setValue(codes, forKey: "code")
        UserDefaults.standard.setValue(currency, forKey: "currency")
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        tableView.beginUpdates()
        flag.remove(at: indexPath.row)
        name.remove(at: indexPath.row)
        codes.remove(at: indexPath.row)
        currency.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
        
        UserDefaults.standard.setValue(flag, forKey: "flag")
        UserDefaults.standard.setValue(name, forKey: "name")
        UserDefaults.standard.setValue(codes, forKey: "code")
        UserDefaults.standard.setValue(currency, forKey: "currency")
    }

}
