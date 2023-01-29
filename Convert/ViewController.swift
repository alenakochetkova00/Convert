
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textLabel: UILabel!
    let url = URL(string: "http://apilayer.net/api/live?access_key=b2ce674576c2bad12b1d07b0f708c485&currencies=RUB,%20AUD,%20AZN,%20GBP,%20AMD,%20BYN&source=USD&format=1")!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeRequest()
        }
    
    func makeRequest() {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print(error?.localizedDescription as Any)
                return
                
            }
                do {
                    let parsedData = try JSONDecoder().decode(CurrencyConversion.self, from: data)
                    self.doLableChange(currency: parsedData)
                } catch {
                    print("error")
                    return
                }
            }
        task.resume()
        }
    
    func doLableChange(currency: CurrencyConversion) {
        DispatchQueue.main.async {
            self.textLabel.text = String(currency.quotes["USDRUB"]!)
        }
    }
}

