
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeRequest(URL: "https://www.cbr.ru/scripts/XML_daily.asp?date_req=") { result in
            print(result)
        }
    }
    
    func makeRequest(URL url: String, completion: @escaping ([CurrencyConversion]) -> Void) {
        
       let url = URL(string: url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if data != nil && error == nil {
                do {
                    let parsingData = try JSONDecoder().decode([CurrencyConversion].self, from: data!)
                    completion(parsingData)
                } catch {
                    print("error")
                }
            }
        }
        dataTask.resume()
    }
}

