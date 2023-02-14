import Foundation

// MARK: - Structure "CurrencyConversion"
struct CurrencyConversion {
    var code: String = ""
    var value: Double = 0
}

// MARK: - Structure "Country"
struct Country {
    var vocabularyCodeCurrencyList: String
    var vocabularyNameCountriesList: String
    var vocabularyFlagsCountriesList: String
    var vocabularyCurrencyCountriesList: Double
}
