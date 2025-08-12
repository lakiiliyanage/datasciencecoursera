import SwiftUI

struct ContentView: View {
    @EnvironmentObject var portfolio: PortfolioViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(portfolio.stocks) { stock in
                    HStack {
                        Text(stock.symbol)
                        Spacer()
                        Text(String(format: "$%.2f", stock.latestPrice))
                    }
                }
            }
            .navigationTitle("Portfolio")
            .toolbar {
                Button("Refresh") {
                    portfolio.refresh()
                }
            }
        }
    }
}

#Preview {
    ContentView().environmentObject(PortfolioViewModel())
}
