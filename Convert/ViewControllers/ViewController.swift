import UIKit

// MARK: - View View Controller (working with api)
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchingApiData()
    }

    func fetchingApiData() {
        var request = URLRequest(url: URL(string: "https://www.cbr-xml-daily.ru/daily_json.js")!)
        request.allHTTPHeaderFields = ["authToken": "nil"]
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let joke = try? JSONDecoder().decode(CurrencyConversion.self, from: data) {
                print(joke.previousURL)
            }
        }
        dataTask.resume()
    }
}


//MARK: - Table View Controller (value output)
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}

