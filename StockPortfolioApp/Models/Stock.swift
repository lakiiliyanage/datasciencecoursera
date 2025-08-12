import Foundation

struct Stock: Identifiable, Codable {
    let id: UUID
    let symbol: String
    var latestPrice: Double
    var targetPrice: Double?

    init(symbol: String, latestPrice: Double, targetPrice: Double? = nil) {
        self.id = UUID()
        self.symbol = symbol
        self.latestPrice = latestPrice
        self.targetPrice = targetPrice
    }
}
