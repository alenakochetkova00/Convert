
import UIKit

// MARK: - View View Controller (working with api)
class ViewController: UIViewController {
    
    var arrayKeys = [String]()
    var arrayValues = [Double]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchingApiData(URL: "https://open.er-api.com/v6/latest/USD") { result in
            print(result)
        }
    }

    func fetchingApiData(URL url:String, completion: @escaping (CurrencyConversion) -> Void ) {
        
        let url = URL(string: url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if data != nil && error == nil {
                do {
                    let parsingData = try JSONDecoder().decode(CurrencyConversion.self, from: data!)
                    self.arrayKeys.append(contentsOf: parsingData.rates.keys)
                    self.arrayValues.append(contentsOf: parsingData.rates.values)
                } catch {
                    print("error")
                }
            }
        }
        dataTask.resume()
    }
}


//MARK: - Table View Controller (value output)
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayKeys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = arrayKeys[indexPath.row]
        cell?.detailTextLabel?.text = String(arrayValues[indexPath.row])
        return cell!
    }
}

