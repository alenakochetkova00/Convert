import UIKit


// MARK: - View View Controller (working with api)
class AdditionalViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var list = [String : Double]()
    var listCurrencyText = [String]()
    let listCodeCountries = ["BD": "BDT", "BE": "EUR", "BF": "XOF", "BG": "BGN", "BA": "BAM", "BB": "BBD", "WF": "XPF", "BL": "EUR", "BM": "BMD", "BN": "BND", "BO": "BOB", "BH": "BHD", "BI": "BIF", "BJ": "XOF", "BT": "BTN", "JM": "JMD", "BV": "NOK", "BW": "BWP", "WS": "WST", "BQ": "USD", "BR": "BRL", "BS": "BSD", "JE": "GBP", "BY": "BYR", "BZ": "BZD", "RU": "RUB", "RW": "RWF", "RS": "RSD", "TL": "USD", "RE": "EUR", "TM": "TMT", "TJ": "TJS", "RO": "RON", "TK": "NZD", "GW": "XOF", "GU": "USD", "GT": "GTQ", "GS": "GBP", "GR": "EUR", "GQ": "XAF", "GP": "EUR", "JP": "JPY", "GY": "GYD", "GG": "GBP", "GF": "EUR", "GE": "GEL", "GD": "XCD", "GB": "GBP", "GA": "XAF", "SV": "USD", "GN": "GNF", "GM": "GMD", "GL": "DKK", "GI": "GIP", "GH": "GHS", "OM": "OMR", "TN": "TND", "JO": "JOD", "HR": "HRK", "HT": "HTG", "HU": "HUF", "HK": "HKD", "HN": "HNL", "HM": "AUD", "VE": "VEF", "PR": "USD", "PS": "ILS", "PW": "USD", "PT": "EUR", "SJ": "NOK", "PY": "PYG", "IQ": "IQD", "PA": "PAB", "PF": "XPF", "PG": "PGK", "PE": "PEN", "PK": "PKR", "PH": "PHP", "PN": "NZD", "PL": "PLN", "PM": "EUR", "ZM": "ZMK", "EH": "MAD", "EE": "EUR", "EG": "EGP", "ZA": "ZAR", "EC": "USD", "IT": "EUR", "VN": "VND", "SB": "SBD", "ET": "ETB", "SO": "SOS", "ZW": "ZWL", "SA": "SAR", "ES": "EUR", "ER": "ERN", "ME": "EUR", "MD": "MDL", "MG": "MGA", "MF": "EUR", "MA": "MAD", "MC": "EUR", "UZ": "UZS", "MM": "MMK", "ML": "XOF", "MO": "MOP", "MN": "MNT", "MH": "USD", "MK": "MKD", "MU": "MUR", "MT": "EUR", "MW": "MWK", "MV": "MVR", "MQ": "EUR", "MP": "USD", "MS": "XCD", "MR": "MRO", "IM": "GBP", "UG": "UGX", "TZ": "TZS", "MY": "MYR", "MX": "MXN", "IL": "ILS", "FR": "EUR", "IO": "USD", "SH": "SHP", "FI": "EUR", "FJ": "FJD", "FK": "FKP", "FM": "USD", "FO": "DKK", "NI": "NIO", "NL": "EUR", "NO": "NOK", "NA": "NAD", "VU": "VUV", "NC": "XPF", "NE": "XOF", "NF": "AUD", "NG": "NGN", "NZ": "NZD", "NP": "NPR", "NR": "AUD", "NU": "NZD", "CK": "NZD", "XK": "EUR", "CI": "XOF", "CH": "CHF", "CO": "COP", "CN": "CNY", "CM": "XAF", "CL": "CLP", "CC": "AUD", "CA": "CAD", "CG": "XAF", "CF": "XAF", "CD": "CDF", "CZ": "CZK", "CY": "EUR", "CX": "AUD", "CR": "CRC", "CW": "ANG", "CV": "CVE", "CU": "CUP", "SZ": "SZL", "SY": "SYP", "SX": "ANG", "KG": "KGS", "KE": "KES", "SS": "SSP", "SR": "SRD", "KI": "AUD", "KH": "KHR", "KN": "XCD", "KM": "KMF", "ST": "STD", "SK": "EUR", "KR": "KRW", "SI": "EUR", "KP": "KPW", "KW": "KWD", "SN": "XOF", "SM": "EUR", "SL": "SLL", "SC": "SCR", "KZ": "KZT", "KY": "KYD", "SG": "SGD", "SE": "SEK", "SD": "SDG", "DO": "DOP", "DM": "XCD", "DJ": "DJF", "DK": "DKK", "VG": "USD", "DE": "EUR", "YE": "YER", "DZ": "DZD", "US": "USD", "UY": "UYU", "YT": "EUR", "UM": "USD", "LB": "LBP", "LC": "XCD", "LA": "LAK", "TV": "AUD", "TW": "TWD", "TT": "TTD", "TR": "TRY", "LK": "LKR", "LI": "CHF", "LV": "EUR", "TO": "TOP", "LT": "LTL", "LU": "EUR", "LR": "LRD", "LS": "LSL", "TH": "THB", "TF": "EUR", "TG": "XOF", "TD": "XAF", "TC": "USD", "LY": "LYD", "VA": "EUR", "VC": "XCD", "AE": "AED", "AD": "EUR", "AG": "XCD", "AF": "AFN", "AI": "XCD", "VI": "USD", "IS": "ISK", "IR": "IRR", "AM": "AMD", "AL": "ALL", "AO": "AOA", "AQ": "", "AS": "USD", "AR": "ARS", "AU": "AUD", "AT": "EUR", "AW": "AWG", "IN": "INR", "AX": "EUR", "AZ": "AZN", "IE": "EUR", "ID": "IDR", "UA": "UAH", "QA": "QAR", "MZ": "MZN"]
    
    let dictionaryNamesCountries = ["AC": "Ascension Island", "AD": "Andorra", "AE": "United Arab Emirates", "AF": "Afghanistan", "AG": "Antigua & Barbuda", "AI": "Anguilla", "AL": "Albania", "AM": "Armenia", "AO": "Angola", "AQ": "Antarctica", "AR": "Argentina", "AS": "American Samoa", "AT": "Austria", "AU": "Aruba", "AX": "Aland Islands", "AZ": "Azerbaijan", "BA": "Bosnia & Herzegovina", "BB": "Barbados", "BD": "Bangladesh", "BE": "Belgium", "BF": "Burkina Faso", "BG": "Bulgaria", "BH": "Bahrain", "BI": "Burundi", "BJ": "Benin", "BL": "St. Barthelemy", "BM": "Bermuda", "BN": "Brunei", "BO": "Bolivia", "BQ": "Caribbean Netherlands", "BR": "Bahamas", "BT": "Bhutan", "BV": "Bouvet Island" ]
    
    let vocabularyFlagsCountries = ["Ascension Island": "🇦🇨", "Andorra": "🇦🇩", "United Arab Emirates": "🇦🇪", "Afghanistan": "🇦🇫", "Antigua & Barbuda": "🇦🇬", "Anguilla": "🇦🇮", "Albania": "🇦🇱", "Armenia": "🇦🇲", "Angola": "🇦🇴", "Antarctica": "🇦🇶", "Argentina": "🇦🇷", "American Samoa": "🇦🇸", "Austria": "🇦🇹", "Australia": "🇦🇺", "Aruba": "🇦🇼", "Aland Islands": "🇦🇽", "Azerbaijan": "🇦🇿", "Bosnia & Herzegovina": "🇧🇦", "Barbados": "🇧🇧", "Bangladesh": "🇧🇩", "Belgium": "🇧🇪", "Burkina Faso": "🇧🇫", "Bulgaria": "🇧🇬", "Bahrain": "🇧🇭", "Burundi": "🇧🇮", "Benin": "🇧🇯", "St. Barthelemy": "🇧🇱", "Bermuda": "🇧🇲", "Brunei": "🇧🇳", "Bolivia": "🇧🇴", "Caribbean Netherlands": "🇧🇶", "Brazil": "🇧🇷", "Bahamas": "🇧🇸", "Bhutan": "🇧🇹", "Bouvet Island": "🇧🇻"]
    
    var dictionaryCodeCountriesList = [String]()
    var dictionaryNamesCountriesList = [String]()
    var vocabularyFlagsCountriesList = [String]()
    var listCurrencyValue = [Double]()
    
    var arrayCodeCountries = [String]()
    var arrayNamesCountries = [String]()
    var arrayFlagsCountries = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.isEditing = true
        self.tableView.allowsMultipleSelectionDuringEditing = true
        
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

                            for (keys, values) in Array(list).sorted(by: {$0.0 < $1.0}) {
                                listCurrencyText.append(keys)
                                listCurrencyValue.append(values)
                                
                                for (key, value) in Array(listCodeCountries) {
                                    if value == keys {
                                        dictionaryCodeCountriesList.append(value)
                                        
                                        for (keyis, valuis) in Array(dictionaryNamesCountries) {
                                            if keyis == key {
                                                dictionaryNamesCountriesList.append(valuis)
                                                
                                                for (keiz, valuez) in Array(vocabularyFlagsCountries) {
                                                    if keiz == valuis {
                                                        vocabularyFlagsCountriesList.append(valuez)
                                                        
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            print(list)
                            print(vocabularyFlagsCountriesList)
                            print(dictionaryNamesCountriesList)
                            print(dictionaryCodeCountriesList)
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
    
    func selectDeselectCell(tabelView: UITableView, indexPath: IndexPath) {
        
        if let array = tableView.indexPathsForSelectedRows {
            for index in array {
                
                if UserDefaults.standard.object(forKey: "flag") != nil {
                    arrayFlagsCountries = UserDefaults.standard.object(forKey: "flag") as! [String]
                }
                if UserDefaults.standard.object(forKey: "name") != nil {
                    arrayNamesCountries = UserDefaults.standard.object(forKey: "name") as! [String]
                }
                if UserDefaults.standard.object(forKey: "code") != nil {
                    arrayCodeCountries = UserDefaults.standard.object(forKey: "code") as! [String]
                }
                
                if !arrayFlagsCountries.contains(vocabularyFlagsCountriesList[index.row]) {arrayFlagsCountries.insert(vocabularyFlagsCountriesList[index.row], at: 0)}
                if !arrayNamesCountries.contains(dictionaryNamesCountriesList[index.row]) {arrayNamesCountries.insert(dictionaryNamesCountriesList[index.row], at: 0)}
                if !arrayCodeCountries.contains(dictionaryCodeCountriesList[index.row]) {arrayCodeCountries.insert(dictionaryCodeCountriesList[index.row], at: 0)}
            }
        }
        UserDefaults.standard.setValue(arrayFlagsCountries, forKey: "flag")
        UserDefaults.standard.setValue(arrayNamesCountries, forKey: "name")
        UserDefaults.standard.setValue(arrayCodeCountries, forKey: "code")
        
        print(arrayFlagsCountries)
        print(arrayNamesCountries)
        print(arrayCodeCountries)
    }
}

// MARK: - Table View Controller (value output)
extension AdditionalViewController: UITableViewDataSource, UITableViewDelegate {
    
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vocabularyFlagsCountriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AdditionalTableViewCell
        cell.flag.text = String(vocabularyFlagsCountriesList[indexPath.row])
        cell.nameCountries.text = String(dictionaryNamesCountriesList[indexPath.row])
        cell.codeCountries.text = String(dictionaryCodeCountriesList[indexPath.row])

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectDeselectCell(tabelView: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.selectDeselectCell(tabelView: tableView, indexPath: indexPath)
    }
}

