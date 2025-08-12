import Foundation
import UserNotifications

final class PriceAlertManager {
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { _, _ in }
    }

    func sendAlert(for stock: Stock) {
        let content = UNMutableNotificationContent()
        content.title = "Target reached"
        content.body = "\(stock.symbol) has reached $\(String(format: "%.2f", stock.latestPrice))"
        let request = UNNotificationRequest(identifier: stock.id.uuidString, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request)
    }
}
