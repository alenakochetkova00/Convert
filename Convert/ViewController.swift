
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textLabel: UILabel!
    var convert: [CurrencyConversion] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        makeRequest()
    }
    
    private func makeRequest() {
        let request = URLRequest(url: URL(string: "https://www.cbr.ru/scripts/XML_daily.asp?date_req=")!)
        
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            print(String(decoding: data!, as: UTF8.self))
            print(error as Any)
        }
        task.resume()
    }
}

