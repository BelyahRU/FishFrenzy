import Foundation

class CoinsManager {

    static let shared = CoinsManager()
    
    private init() {}
    
    private let userDefaults = UserDefaults.standard
    private let coinsKey = "coins"

    var currentCoins: Int {
        get {
            return userDefaults.integer(forKey: coinsKey)
        }
        set {
            userDefaults.set(newValue, forKey: coinsKey)
        }
    }

    func addCoins(amount: Int) {
        currentCoins += amount
    }

    func subtractCoins(amount: Int) {
        if currentCoins >= amount {
            currentCoins -= amount
        } else {
            print("Недостаточно монет!")
        }
    }
    
    
}
