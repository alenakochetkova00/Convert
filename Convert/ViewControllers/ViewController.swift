import UIKit


// MARK: - View View Controller (working with api)
class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var list = [String : Double]()
    var listCurrencyText = [String]()
    var listCurrencyValue = [Double]()
    
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
        
        getData()
    }
    
    func getData() {
        
        let url = URL(string: "https://open.er-api.com/v6/latest/USD")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                print(error?.localizedDescription as Any)
                
            } else {
                
                if data != nil {
                    
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        print(jsonResponse)
                        
                        DispatchQueue.main.async { [self] in
                            
                            let array = Array(jsonResponse["rates"] as! [String : Double])

                            for (key, value) in array {
                               
                               var entity = CurrencyConversion()
                               entity.code = key
                               entity.value = value
                               self.list.updateValue(value, forKey: key)
                                
                            }

                            for (key, value) in Array(list).sorted(by: {$0.0 < $1.0}) {
                                listCurrencyText.append(key)
                                listCurrencyValue.append(value)
                            }
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
}


//MARK: - Table View Controller (value output)
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCurrencyText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = listCurrencyText[indexPath.row]
        cell.detailTextLabel?.text = String(listCurrencyValue[indexPath.row])
        
        return cell
    }
}

