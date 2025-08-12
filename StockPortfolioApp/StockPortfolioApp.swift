import SwiftUI

@main
struct StockPortfolioApp: App {
    @StateObject private var portfolio = PortfolioViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(portfolio)
        }
    }
}
