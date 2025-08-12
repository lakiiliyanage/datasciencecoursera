import Foundation

@MainActor
final class PortfolioViewModel: ObservableObject {
    @Published private(set) var stocks: [Stock] = [
        Stock(symbol: "AAPL", latestPrice: 0, targetPrice: 200),
        Stock(symbol: "MSFT", latestPrice: 0, targetPrice: 350)
    ]

    private let service = StockService()
    private let alertManager = PriceAlertManager()

    func refresh() {
        Task {
            for index in stocks.indices {
                let symbol = stocks[index].symbol
                if let price = try? await service.fetchPrice(for: symbol) {
                    stocks[index].latestPrice = price
                    if let target = stocks[index].targetPrice, price >= target {
                        alertManager.sendAlert(for: stocks[index])
                    }
                }
            }
        }
    }

    func add(symbol: String, targetPrice: Double?) {
        let stock = Stock(symbol: symbol, latestPrice: 0, targetPrice: targetPrice)
        stocks.append(stock)
    }
}
