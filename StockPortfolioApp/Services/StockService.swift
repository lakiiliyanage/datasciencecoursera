import Foundation

struct StockService {
    func fetchPrice(for symbol: String) async throws -> Double {
        let query = symbol.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? symbol
        let url = URL(string: "https://query1.finance.yahoo.com/v7/finance/quote?symbols=\(query)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        struct Response: Codable {
            let quoteResponse: QuoteResponse
            struct QuoteResponse: Codable {
                let result: [Quote]
            }
            struct Quote: Codable {
                let regularMarketPrice: Double?
            }
        }
        let response = try JSONDecoder().decode(Response.self, from: data)
        return response.quoteResponse.result.first?.regularMarketPrice ?? 0
    }
}
