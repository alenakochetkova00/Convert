import UIKit

// MARK: - View View Controller (working with api)
class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var list = [CurrencyConversion]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData() {
        
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=4a990ae1cc0ef5a920e4c7e9eeb1123c")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                print(error?.localizedDescription)
            }else {
                
                if data != nil {
                    
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        print(jsonResponse)
                        
                        DispatchQueue.main.async {
                            
                            let array = Array(jsonResponse["rates"] as! [String : Any])

                            for (key, value) in array {
                               
                               var entity = CurrencyConversion()
                               entity.code = key
                               entity.value = value as! Double
                               self.list.append(entity)
                            }

                            print(self.list.count)
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
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let curreny = list[indexPath.row]
        
        cell.textLabel?.text = "\(curreny.code)"
        cell.detailTextLabel?.text = "\(curreny.value)"
        
        return cell
    }
}

