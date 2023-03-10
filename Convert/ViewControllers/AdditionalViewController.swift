import UIKit

// MARK: - View View Controller (working with api)
class AdditionalViewController: UIViewController, UISearchBarDelegate, UISearchControllerDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    // initialize the main dictionaries
    let searchController = UISearchController(searchResultsController: nil)
    var listCurrencyCountries = [String : Double]()
    let listCodeCountries = ["BD": "BDT", "BE": "EUR", "BF": "XOF", "BG": "BGN", "BA": "BAM", "BB": "BBD", "WF": "XPF", "BL": "EUR", "BM": "BMD", "BN": "BND", "BO": "BOB", "BH": "BHD", "BI": "BIF", "BJ": "XOF", "BT": "BTN", "JM": "JMD", "BV": "NOK", "BW": "BWP", "WS": "WST", "BQ": "USD", "BR": "BRL", "BS": "BSD", "JE": "GBP", "BY": "BYR", "BZ": "BZD", "RU": "RUB", "RW": "RWF", "RS": "RSD", "TL": "USD", "RE": "EUR", "TM": "TMT", "TJ": "TJS", "RO": "RON", "TK": "NZD", "GW": "XOF", "GU": "USD", "GT": "GTQ", "GS": "GBP", "GR": "EUR", "GQ": "XAF", "GP": "EUR", "JP": "JPY", "GY": "GYD", "GG": "GBP", "GF": "EUR", "GE": "GEL", "GD": "XCD", "GB": "GBP", "GA": "XAF", "SV": "USD", "GN": "GNF", "GM": "GMD", "GL": "DKK", "GI": "GIP", "GH": "GHS", "OM": "OMR", "TN": "TND", "JO": "JOD", "HR": "HRK", "HT": "HTG", "HU": "HUF", "HK": "HKD", "HN": "HNL", "HM": "AUD", "VE": "VEF", "PR": "USD", "PS": "ILS", "PW": "USD", "PT": "EUR", "SJ": "NOK", "PY": "PYG", "IQ": "IQD", "PA": "PAB", "PF": "XPF", "PG": "PGK", "PE": "PEN", "PK": "PKR", "PH": "PHP", "PN": "NZD", "PL": "PLN", "PM": "EUR", "ZM": "ZMK", "EH": "MAD", "EE": "EUR", "EG": "EGP", "ZA": "ZAR", "EC": "USD", "IT": "EUR", "VN": "VND", "SB": "SBD", "ET": "ETB", "SO": "SOS", "ZW": "ZWL", "SA": "SAR", "ES": "EUR", "ER": "ERN", "ME": "EUR", "MD": "MDL", "MG": "MGA", "MF": "EUR", "MA": "MAD", "MC": "EUR", "UZ": "UZS", "MM": "MMK", "ML": "XOF", "MO": "MOP", "MN": "MNT", "MH": "USD", "MK": "MKD", "MU": "MUR", "MT": "EUR", "MW": "MWK", "MV": "MVR", "MQ": "EUR", "MP": "USD", "MS": "XCD", "MR": "MRO", "IM": "GBP", "UG": "UGX", "TZ": "TZS", "MY": "MYR", "MX": "MXN", "IL": "ILS", "FR": "EUR", "IO": "USD", "SH": "SHP", "FI": "EUR", "FJ": "FJD", "FK": "FKP", "FM": "USD", "FO": "DKK", "NI": "NIO", "NL": "EUR", "NO": "NOK", "NA": "NAD", "VU": "VUV", "NC": "XPF", "NE": "XOF", "NF": "AUD", "NG": "NGN", "NZ": "NZD", "NP": "NPR", "NR": "AUD", "NU": "NZD", "CK": "NZD", "XK": "EUR", "CI": "XOF", "CH": "CHF", "CO": "COP", "CN": "CNY", "CM": "XAF", "CL": "CLP", "CC": "AUD", "CA": "CAD", "CG": "XAF", "CF": "XAF", "CD": "CDF", "CZ": "CZK", "CY": "EUR", "CX": "AUD", "CR": "CRC", "CW": "ANG", "CV": "CVE", "CU": "CUP", "SZ": "SZL", "SY": "SYP", "SX": "ANG", "KG": "KGS", "KE": "KES", "SS": "SSP", "SR": "SRD", "KI": "AUD", "KH": "KHR", "KN": "XCD", "KM": "KMF", "ST": "STD", "SK": "EUR", "KR": "KRW", "SI": "EUR", "KP": "KPW", "KW": "KWD", "SN": "XOF", "SM": "EUR", "SL": "SLL", "SC": "SCR", "KZ": "KZT", "KY": "KYD", "SG": "SGD", "SE": "SEK", "SD": "SDG", "DO": "DOP", "DM": "XCD", "DJ": "DJF", "DK": "DKK", "VG": "USD", "DE": "EUR", "YE": "YER", "DZ": "DZD", "US": "USD", "UY": "UYU", "YT": "EUR", "UM": "USD", "LB": "LBP", "LC": "XCD", "LA": "LAK", "TV": "AUD", "TW": "TWD", "TT": "TTD", "TR": "TRY", "LK": "LKR", "LI": "CHF", "LV": "EUR", "TO": "TOP", "LT": "LTL", "LU": "EUR", "LR": "LRD", "LS": "LSL", "TH": "THB", "TF": "EUR", "TG": "XOF", "TD": "XAF", "TC": "USD", "LY": "LYD", "VA": "EUR", "VC": "XCD", "AE": "AED", "AD": "EUR", "AG": "XCD", "AF": "AFN", "AI": "XCD", "VI": "USD", "IS": "ISK", "IR": "IRR", "AM": "AMD", "AL": "ALL", "AO": "AOA", "AQ": "", "AS": "USD", "AR": "ARS", "AU": "AUD", "AT": "EUR", "AW": "AWG", "IN": "INR", "AX": "EUR", "AZ": "AZN", "IE": "EUR", "ID": "IDR", "UA": "UAH", "QA": "QAR", "MZ": "MZN"]
    
    let listNamesCountries = ["AC": "Ascension Island", "AD": "Andorra", "AE": "United Arab Emirates", "AF": "Afghanistan", "AG": "Antigua & Barbuda", "AI": "Anguilla", "AL": "Albania", "AM": "Armenia", "AO": "Angola", "AQ": "Antarctica", "AR": "Argentina", "AS": "American Samoa", "AT": "Austria", "AU": "Australia", "AW": "Aruba", "AX": "??land Islands", "AZ": "Azerbaijan", "BA": "Bosnia & Herzegovina", "BB": "Barbados", "BD": "Bangladesh", "BE": "Belgium", "BF": "Burkina Faso", "BG": "Bulgaria", "BH": "Bahrain", "BI": "Burundi", "BJ": "Benin", "BL": "St. Barth??lemy", "BM": "Bermuda", "BN": "Brunei", "BO": "Bolivia", "BQ": "Caribbean Netherlands", "BR": "Brazil", "BS": "Bahamas", "BT": "Bhutan", "BV": "Bouvet Island", "BW": "Botswana", "BY": "Belarus", "BZ": "Belize", "CA": "Canada", "CC": "Cocos (Keeling) Islands", "CD": "Congo - Kinshasa", "CF": "Central African Republic", "CG": "Congo - Brazzaville", "CH": "Switzerland", "CI": "C??te d???Ivoire", "CK": "Cook Islands", "CL": "Chile", "CM": "Cameroon", "CN": "China", "CO": "Colombia", "CP": "Clipperton Island", "CR": "Costa Rica", "CU": "Cuba", "CV": "Cape Verde", "CW": "Cura??ao", "CX": "Christmas Island", "CY": "Cyprus", "CZ": "Czechia", "DE": "Germany", "DG": "Diego Garcia", "DJ": "Djibouti", "DK": "Denmark", "DM": "Dominica", "DO": "Dominican Republic", "DZ": "Algeria", "EA": "Ceuta & Melilla", "EC": "Ecuador", "EE": "Estonia", "EG": "Egypt", "EH": "Western Sahara", "ER": "Eritrea", "ES": "Spain", "ET": "Ethiopia", "EU": "European Union", "FI": "Finland", "FJ": "Fiji", "FK": "Falkland Islands", "FM": "Micronesia", "FO": "Faroe Islands", "FR": "France", "GA": "Gabon", "GB": "United Kingdom", "GD": "Grenada", "GE": "Georgia", "GF": "French Guiana", "GG": "Guernsey", "GH": "Ghana", "GI": "Gibraltar", "GL": "Greenland", "GM": "Gambia", "GN": "Guinea", "GP": "Guadeloupe", "GQ": "Equatorial Guinea", "GR": "Greece", "GS": "South Georgia & South Sandwich Islands", "GT": "Guatemala", "GU": "Guam", "GW": "Guinea-Bissau", "GY": "Guyana", "HK": "Hong Kong SAR China", "HM": "Heard & McDonald Islands", "HN": "Honduras", "HR": "Croatia", "HT": "Haiti", "HU": "Hungary", "IC": "Canary Islands", "ID": "Indonesia", "IE": "Ireland", "IL": "Israel", "IM": "Isle of Man", "IN": "India", "IO": "British Indian Ocean Territory", "IQ": "Iraq", "IR": "Iran", "IS": "Iceland", "IT": "Italy", "JE": "Jersey", "JM": "Jamaica", "JO": "Jordan", "JP": "Japan", "KE": "Kenya", "KG": "Kyrgyzstan", "KH": "Cambodia", "KI": "Kiribati", "KM": "Comoros", "KN": "St. Kitts & Nevis", "KP": "North Korea", "KR": "South Korea", "KW": "Kuwait", "KY": "Cayman Islands", "KZ": "Kazakhstan", "LA": "Laos", "LB": "Lebanon", "LC": "St. Lucia", "LI": "Liechtenstein", "LK": "Sri Lanka", "LR": "Liberia", "LS": "Lesotho", "LT": "Lithuania", "LU": "Luxembourg", "LV": "Latvia", "LY": "Libya", "MA": "Morocco", "MC": "Monaco", "MD": "Moldova", "ME": "Montenegro", "MF": "St. Martin", "MG": "Madagascar", "MH": "Marshall Islands", "MK": "North Macedonia", "ML": "Mali", "MM": "Myanmar (Burma)", "MN": "Mongolia", "MO": "Macao SAR China", "MP": "Northern Mariana Islands", "MQ": "Martinique", "MR": "Mauritania", "MS": "Montserrat", "MT": "Malta", "MU": "Mauritius", "MV": "Maldives", "MW": "Malawi", "MX": "Mexico", "MY": "Malaysia", "MZ": "Mozambique", "NA": "Namibia", "NC": "New Caledonia", "NE": "Niger", "NF": "Norfolk Island", "NG": "Nigeria", "NI": "Nicaragua", "NL": "Netherlands", "NO": "Norway", "NP": "Nepal", "NR": "Nauru", "NU": "Niue", "NZ": "New Zealand", "OM": "Oman", "PA": "Panama", "PE": "Peru", "PF": "French Polynesia", "PG": "Papua New Guinea", "PH": "Philippines", "PK": "Pakistan", "PL": "Poland", "PM": "St. Pierre & Miquelon", "PN": "Pitcairn Islands", "PR": "Puerto Rico", "PS": "Palestinian Territories", "PT": "Portugal", "PW": "Palau", "PY": "Paraguay", "QA": "Qatar", "RE": "R??union", "RO": "Romania", "RS": "Serbia", "RU": "Russia", "RW": "Rwanda", "SA": "Saudi Arabia", "SB": "Solomon Islands", "SC": "Seychelles", "SD": "Sudan", "SE": "Sweden", "SG": "Singapore", "SH": "St. Helena", "SI": "Slovenia", "SJ": "Svalbard & Jan Mayen", "SK": "Slovakia", "SL": "Sierra Leone", "SM": "San Marino", "SN": "Senegal", "SO": "Somalia", "SR": "Suriname", "SS": "South Sudan", "ST": "S??o Tom?? & Pr??ncipe", "SV": "El Salvador", "SX": "Sint Maarten", "SY": "Syria", "SZ": "Eswatini", "TA": "Tristan da Cunha", "TC": "Turks & Caicos Islands", "TD": "Chad", "TF": "French Southern Territories", "TG": "Togo", "TH": "Thailand", "TJ": "Tajikistan", "TK": "Tokelau", "TL": "Timor-Leste", "TM": "Turkmenistan", "TN": "Tunisia", "TO": "Tonga", "TR": "Turkey", "TT": "Trinidad & Tobago", "TV": "Tuvalu", "TW": "Taiwan", "TZ": "Tanzania", "UA": "Ukraine", "UG": "Uganda", "UM": "U.S. Outlying Islands", "UN": "United Nations", "US": "United States", "UY": "Uruguay", "UZ": "Uzbekistan", "VA": "Vatican City", "VC": "St. Vincent & Grenadines", "VE": "Venezuela", "VG": "British Virgin Islands", "VI": "U.S. Virgin Islands", "VN": "Vietnam", "VU": "Vanuatu", "WF": "Wallis & Futuna", "WS": "Samoa", "XK": "Kosovo", "YE": "Yemen", "YT": "Mayotte", "ZA": "South Africa", "ZM": "Zambia", "ZW": "Zimbabwe"]

    let listFlagsCountries = ["Ascension Island": "????????", "Andorra": "????????", "United Arab Emirates": "????????", "Afghanistan": "????????", "Antigua & Barbuda": "????????", "Anguilla": "????????", "Albania": "????????", "Armenia": "????????", "Angola": "????????", "Antarctica": "????????", "Argentina": "????????", "American Samoa": "????????", "Austria": "????????", "Australia": "????????", "Aruba": "????????", "??land Islands": "????????", "Azerbaijan": "????????", "Bosnia & Herzegovina": "????????", "Barbados": "????????", "Bangladesh": "????????", "Belgium": "????????", "Burkina Faso": "????????", "Bulgaria": "????????", "Bahrain": "????????", "Burundi": "????????", "Benin": "????????", "St. Barth??lemy": "????????", "Bermuda": "????????", "Brunei": "????????", "Bolivia": "????????", "Caribbean Netherlands": "????????", "Brazil": "????????", "Bahamas": "????????", "Bhutan": "????????", "Bouvet Island": "????????", "Botswana": "????????", "Belarus": "????????", "Belize": "????????", "Canada": "????????", "Cocos (Keeling) Islands": "????????", "Congo - Kinshasa": "????????", "Central African Republic": "????????", "Congo - Brazzaville": "????????", "Switzerland": "????????", "C??te d???Ivoire": "????????", "Cook Islands": "????????", "Chile": "????????", "Cameroon": "????????", "China": "????????", "Colombia": "????????", "Clipperton Island": "????????", "Costa Rica": "????????", "Cuba": "????????", "Cape Verde": "????????", "Cura??ao": "????????", "Christmas Island": "????????", "Cyprus": "????????", "Czechia": "????????", "Germany": "????????", "Diego Garcia": "????????", "Djibouti": "????????", "Denmark": "????????", "Dominica": "????????", "Dominican Republic": "????????", "Algeria": "????????", "Ceuta & Melilla": "????????", "Ecuador": "????????", "Estonia": "????????", "Egypt": "????????", "Western Sahara": "????????", "Eritrea": "????????", "Spain": "????????", "Ethiopia": "????????", "European Union": "????????", "Finland": "????????", "Fiji": "????????", "Falkland Islands": "????????", "Micronesia": "????????", "Faroe Islands": "????????", "France": "????????", "Gabon": "????????", "United Kingdom": "????????", "Grenada": "????????", "Georgia": "????????", "French Guiana": "????????", "Guernsey": "????????", "Ghana": "????????", "Gibraltar": "????????", "Greenland": "????????", "Gambia": "????????", "Guinea": "????????", "Guadeloupe": "????????", "Equatorial Guinea": "????????", "Greece": "????????", "South Georgia & South Sandwich Islands": "????????", "Guatemala": "????????", "Guam": "????????", "Guinea-Bissau": "????????", "Guyana": "????????", "Hong Kong SAR China": "????????", "Heard & McDonald Islands": "????????", "Honduras": "????????", "Croatia": "????????", "Haiti": "????????", "Hungary": "????????", "Canary Islands": "????????", "Indonesia": "????????", "Ireland": "????????", "Israel": "????????", "Isle of Man": "????????", "India": "????????", "British Indian Ocean Territory": "????????", "Iraq": "????????", "Iran": "????????", "Iceland": "????????", "Italy": "????????", "Jersey": "????????", "Jamaica": "????????", "Jordan": "????????", "Japan": "????????", "Kenya": "????????", "Kyrgyzstan": "????????", "Cambodia": "????????", "Kiribati": "????????", "Comoros": "????????", "St. Kitts & Nevis": "????????", "North Korea": "????????", "South Korea": "????????", "Kuwait": "????????", "Cayman Islands": "????????", "Kazakhstan": "????????", "Laos": "????????", "Lebanon": "????????", "St. Lucia": "????????", "Liechtenstein": "????????", "Sri Lanka": "????????", "Liberia": "????????", "Lesotho": "????????", "Lithuania": "????????", "Luxembourg": "????????", "Latvia": "????????", "Libya": "????????", "Morocco": "????????", "Monaco": "????????", "Moldova": "????????", "Montenegro": "????????", "St. Martin": "????????", "Madagascar": "????????", "Marshall Islands": "????????", "North Macedonia": "????????", "Mali": "????????", "Myanmar (Burma)": "????????", "Mongolia": "????????", "Macao SAR China": "????????", "Northern Mariana Islands": "????????", "Martinique": "????????", "Mauritania": "????????", "Montserrat": "????????", "Malta": "????????", "Mauritius": "????????", "Maldives": "????????", "Malawi": "????????", "Mexico": "????????", "Malaysia": "????????", "Mozambique": "????????", "Namibia": "????????", "New Caledonia": "????????", "Niger": "????????", "Norfolk Island": "????????", "Nigeria": "????????", "Nicaragua": "????????", "Netherlands": "????????", "Norway": "????????", "Nepal": "????????", "Nauru": "????????", "Niue": "????????", "New Zealand": "????????", "Oman": "????????", "Panama": "????????", "Peru": "????????", "French Polynesia": "????????", "Papua New Guinea": "????????", "Philippines": "????????", "Pakistan": "????????", "Poland": "????????", "St. Pierre & Miquelon": "????????", "Pitcairn Islands": "????????", "Puerto Rico": "????????", "Palestinian Territories": "????????", "Portugal": "????????", "Palau": "????????", "Paraguay": "????????", "Qatar": "????????", "R??union": "????????", "Romania": "????????", "Serbia": "????????", "Russia": "????????", "Rwanda": "????????", "Saudi Arabia": "????????", "Solomon Islands": "????????", "Seychelles": "????????", "Sudan": "????????", "Sweden": "????????", "Singapore": "????????", "St. Helena": "????????", "Slovenia": "????????", "Svalbard & Jan Mayen": "????????", "Slovakia": "????????", "Sierra Leone": "????????", "San Marino": "????????", "Senegal": "????????", "Somalia": "????????", "Suriname": "????????", "South Sudan": "????????", "S??o Tom?? & Pr??ncipe": "????????", "El Salvador": "????????", "Sint Maarten": "????????", "Syria": "????????", "Eswatini": "????????", "Tristan da Cunha": "????????", "Turks & Caicos Islands": "????????", "Chad": "????????", "French Southern Territories": "????????", "Togo": "????????", "Thailand": "????????", "Tajikistan": "????????", "Tokelau": "????????", "Timor-Leste": "????????", "Turkmenistan": "????????", "Tunisia": "????????", "Tonga": "????????", "Turkey": "????????", "Trinidad & Tobago": "????????", "Tuvalu": "????????", "Taiwan": "????????", "Tanzania": "????????", "Ukraine": "????????", "Uganda": "????????", "U.S. Outlying Islands": "????????", "United Nations": "????????", "United States": "????????", "Uruguay": "????????", "Uzbekistan": "????????", "Vatican City": "????????", "St. Vincent & Grenadines": "????????", "Venezuela": "????????", "British Virgin Islands": "????????", "U.S. Virgin Islands": "????????", "Vietnam": "????????", "Vanuatu": "????????", "Wallis & Futuna": "????????", "Samoa": "????????", "Kosovo": "????????", "Yemen": "????????", "Mayotte": "????????", "South Africa": "????????", "Zambia": "????????", "Zimbabwe": "????????"]
    
    // initialize variables
    var countiesArr = [Country]()
    var filterCountiesArr = [Country]()
    
    var arrayCodeCountries = [String]()
    var arrayNamesCountries = [String]()
    var arrayFlagsCountries = [String]()
    var arrayCurrencyCountries = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set table view color
        self.tableView.backgroundColor = UIColor.white
        
        // the necessary parameters to set the checkboxes
        self.tableView.isEditing = true
        self.tableView.allowsMultipleSelectionDuringEditing = true
        
        visibilitySearchBar()
        searchBarSetup()
        setupNavigationBar()
        getData()
    }
    
    // create a search bar
    private func searchBarSetup() {
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
    
    // make the search bar always visible (no swipe)
    func visibilitySearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        
    }
    
// MARK: - Visual rendering of the Navigation Bar
    func setupNavigationBar() {
        
        navigationController!.navigationBar.tintColor = UIColor.orange
        
        let navBarApperance = UINavigationBarAppearance()
        navBarApperance.configureWithOpaqueBackground()
        navBarApperance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navBarApperance.largeTitleTextAttributes = [.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "Futura Bold", size: 25), size: 25)]
        
        navBarApperance.backgroundColor = UIColor(red: 225/225, green: 225/225, blue: 225/225, alpha: 225/225)
        
        navigationController?.navigationBar.standardAppearance = navBarApperance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarApperance
    }
     
    
// MARK: - Getting data from Json API and adding data to structure
        func getData() {
            
            // working with api json
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
                                
                                for (key, value) in array {
                                    
                                    // write the received data to a separate dictionary
                                    var entity = CurrencyConversion()
                                    entity.code = key
                                    entity.value = value
                                    self.listCurrencyCountries.updateValue(value, forKey: key)
                                    
                                }
                                
                                // comparing dictionaries with each other and outputting data to an array with a structure
                                listNamesCountries.forEach {
                                    let listNamesCountries = $0
                                    let vocabularyNameCountriesList = listNamesCountries.value
                                    guard let vocabularyCodeCurrencyList = listCodeCountries[listNamesCountries.key] else { return }
                                    guard let vocabularyFlagsCountriesList = listFlagsCountries[listNamesCountries.value] else { return }
                                    guard let vocabularyCurrencyCountriesList = listCurrencyCountries[vocabularyCodeCurrencyList] else { return }
                                    
                                    let country = Country(vocabularyCodeCurrencyList: vocabularyCodeCurrencyList, vocabularyNameCountriesList: vocabularyNameCountriesList, vocabularyFlagsCountriesList: vocabularyFlagsCountriesList, vocabularyCurrencyCountriesList: vocabularyCurrencyCountriesList)
                                    
                                    countiesArr.append(country)
                                }
                            
                                // sorting an array alphabetically
                                let sorted = countiesArr.sorted(by: { $0.vocabularyNameCountriesList < $1.vocabularyNameCountriesList })
                                countiesArr.removeAll()
                                countiesArr.append(contentsOf: sorted)
                                filterCountiesArr.append(contentsOf: sorted)
                                
                                print(countiesArr)
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
    
    // when you click on the "search" button, you will go to the navigation controller
    func searchBarSearchButtonClicked(_ seachBar: UISearchBar) {
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NavigationController") as! NavigationController
        self.present(loginVC, animated: true, completion: nil)
    }
    
// MARK: - Actions when the "save" button is clicked
    @IBAction func saveButtonClick(_ sender: Any) {
        
        // go to navigation controller
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NavigationController") as! NavigationController
        self.present(loginVC, animated: true, completion: nil)
    }
}

// MARK: - Table View Controller (value output)
extension AdditionalViewController: UITableViewDataSource, UITableViewDelegate {
    
    // cell width
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    // number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countiesArr.count
    }
    
    // filling cells with data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AdditionalTableViewCell
        
        // fill in the cells
        cell.flagCountries.text = String(countiesArr[indexPath.row].vocabularyFlagsCountriesList)
        cell.nameCountries.text = String(countiesArr[indexPath.row].vocabularyNameCountriesList)
        cell.codeCountries.text = String(countiesArr[indexPath.row].vocabularyCodeCurrencyList)
        
        // cell highlight color
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.systemGray5
        cell.selectedBackgroundView = bgColorView
        
        //clear arrays
        arrayFlagsCountries.removeAll()
        arrayNamesCountries.removeAll()
        arrayCodeCountries.removeAll()
        arrayCurrencyCountries.removeAll()
        
        // fill arrays with data from memory
        if UserDefaults.standard.object(forKey: "flag") != nil {
            arrayFlagsCountries = UserDefaults.standard.object(forKey: "flag") as? [String] ?? []
        }
        if UserDefaults.standard.object(forKey: "name") != nil {
            arrayNamesCountries = UserDefaults.standard.object(forKey: "name") as? [String] ?? []
        }
        if UserDefaults.standard.object(forKey: "code") != nil {
            arrayCodeCountries = UserDefaults.standard.object(forKey: "code") as? [String] ?? []
        }
        if UserDefaults.standard.object(forKey: "currency") != nil {
            arrayCurrencyCountries = UserDefaults.standard.object(forKey: "currency") as? [Double] ?? []
        }
        
        // the values ??????previously selected by the user are ticked
        for name in arrayNamesCountries {
            if name == countiesArr[indexPath.row].vocabularyNameCountriesList {
                tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            }
        }
        return cell
    }
    
    // if the user has selected a cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // if the array does not contain the same country, we add it to the array
        if !arrayNamesCountries.contains(countiesArr[indexPath.row].vocabularyNameCountriesList) {
            arrayCodeCountries.insert(countiesArr[indexPath.row].vocabularyCodeCurrencyList, at: 0)
            arrayCurrencyCountries.insert(countiesArr[indexPath.row].vocabularyCurrencyCountriesList, at: 0)
            arrayNamesCountries.insert(countiesArr[indexPath.row].vocabularyNameCountriesList, at: 0)
            arrayFlagsCountries.insert(countiesArr[indexPath.row].vocabularyFlagsCountriesList, at: 0)
        }
        
        // store an array
        UserDefaults.standard.setValue(arrayFlagsCountries, forKey: "flag")
        UserDefaults.standard.setValue(arrayNamesCountries, forKey: "name")
        UserDefaults.standard.setValue(arrayCodeCountries, forKey: "code")
        UserDefaults.standard.setValue(arrayCurrencyCountries, forKey: "currency")
        
        print("connected", arrayNamesCountries)
    }
    
    // if the user has not selected a cell
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        // if there is a given element in the array, then fix its index
        let index = arrayNamesCountries.firstIndex(of: countiesArr[indexPath.row].vocabularyNameCountriesList)
        
        // remove elements from arrays at this index
        arrayCodeCountries.remove(at: index!)
        arrayCurrencyCountries.remove(at: index!)
        arrayNamesCountries.remove(at: index!)
        arrayFlagsCountries.remove(at: index!)
        
        // write arrays to device memory
        UserDefaults.standard.setValue(arrayFlagsCountries, forKey: "flag")
        UserDefaults.standard.setValue(arrayNamesCountries, forKey: "name")
        UserDefaults.standard.setValue(arrayCodeCountries, forKey: "code")
        UserDefaults.standard.setValue(arrayCurrencyCountries, forKey: "currency")
        
        print("no connected", arrayNamesCountries)
    }
}

// MARK: - We form the work of the search bar
extension AdditionalViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let searchText = searchController.searchBar.text else { return }
        if searchText == "" {
            countiesArr = filterCountiesArr
        } else {
            countiesArr = filterCountiesArr.filter{ $0.vocabularyNameCountriesList.contains(searchText) }
        }
        tableView.reloadData()
    }
}
