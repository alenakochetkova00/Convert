
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textLabel: UILabel!
    
    var currency: [CurrencyConversion] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeRequest(URL: "https://jsonplaceholder.typicode.com/todos") { result in
            self.currency = result
            print(self.currency[0].title)
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

