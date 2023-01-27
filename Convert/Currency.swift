
import Foundation

struct CurrencyConversion: Decodable {
    let id: Int
    let numCode: Int
    let charCode: String
    let nominal: Int
    let name: String
    let value: Float
}
