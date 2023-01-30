
import Foundation


// MARK: - Requested data structure
struct CurrencyConversion: Decodable {
    let rates: [String: Double]
}
