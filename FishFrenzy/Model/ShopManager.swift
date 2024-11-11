import Foundation

class ShopManager {
    private static let defaults = UserDefaults.standard

    static let shared = ShopManager()

    private init() {
        hookLevel = UserDefaults.standard.integer(forKey: "hookLevel") == 0 ? 1 : UserDefaults.standard.integer(forKey: "hookLevel")
        lineLengthLevel = UserDefaults.standard.integer(forKey: "lineLengthLevel") == 0 ? 1 : UserDefaults.standard.integer(forKey: "lineLengthLevel") 
        
        countBreads = (UserDefaults.standard.object(forKey: "breads") == nil) ? 2 : UserDefaults.standard.integer(forKey: "breads")
        countFishes = (UserDefaults.standard.object(forKey: "fishes") == nil) ? 2 : UserDefaults.standard.integer(forKey: "fishes")
        countShrimps = (UserDefaults.standard.object(forKey: "shrimps") == nil) ? 2 : UserDefaults.standard.integer(forKey: "shrimps")

    }

    private(set) var hookLevel: Int = 1 {
        didSet {
            UserDefaults.standard.set(hookLevel, forKey: "hookLevel")
        }
    }
  
    private(set) var lineLengthLevel: Int = 1 {
        didSet {
            UserDefaults.standard.set(lineLengthLevel, forKey: "lineLengthLevel")
        }
    }
    
    private(set) var countBreads: Int = 2 {
        didSet {
            UserDefaults.standard.set(countBreads, forKey: "breads")
        }
    }
    
    private(set) var countFishes: Int = 2 {
        didSet {
            UserDefaults.standard.set(countFishes, forKey: "fishes")
        }
    }
    
    private(set) var countShrimps: Int = 2 {
        didSet {
            UserDefaults.standard.set(countShrimps, forKey: "shrimps")
        }
    }

    func buyHookUpgrade() -> Bool {
        let upgradePrice = 150 // Цена за уровень улучшения
        let nextLevel = hookLevel + 1

        if nextLevel > 12 {
            return false // Уровень уже максимальный
        }

        if CoinsManager.shared.currentCoins >= upgradePrice {
            CoinsManager.shared.subtractCoins(amount: upgradePrice)
            hookLevel = nextLevel
            return true
        } else {
            return false // Недостаточно монет
        }
    }

  // Функция покупки обновления лески
    func buyLineLengthUpgrade() -> Bool {
        let upgradePrice = 150 // Цена за уровень улучшения
        let nextLevel = lineLengthLevel + 1

        if nextLevel > 12 {
            return false // Уровень уже максимальный
        }

        if CoinsManager.shared.currentCoins >= upgradePrice {
            CoinsManager.shared.subtractCoins(amount: upgradePrice)
            lineLengthLevel = nextLevel
            return true
        } else {
            return false // Недостаточно монет
        }
    }
    
    func buyShrimp() -> Bool {
        let shrimpPrice = 200
        if CoinsManager.shared.currentCoins >= shrimpPrice {
            CoinsManager.shared.subtractCoins(amount: shrimpPrice)
            countShrimps += 1
            return true
        } else {
            return false
        }
    }
    
    func spendBread() -> Bool {
        if countBreads - 1 >= 0 {
            countBreads -= 1
            return true
        } else {
            return false
        }
    }
    
    func spendFish() -> Bool {
        if countFishes - 1 >= 0 {
            countFishes -= 1
            return true
        } else {
            return false
        }
    }
    
    func spendShrimp() -> Bool {
        if countShrimps - 1 >= 0 {
            countShrimps -= 1
            return true
        } else {
            return false
        }
    }
    
    func buyFish() -> Bool {
        let fishPrice = 30
        if CoinsManager.shared.currentCoins >= fishPrice {
            CoinsManager.shared.subtractCoins(amount: fishPrice)
            countFishes += 1
            return true
        } else {
            return false
        }
    }
    
    func buyBread() -> Bool {
        let breadPrice = 10
        if CoinsManager.shared.currentCoins >= breadPrice {
            CoinsManager.shared.subtractCoins(amount: breadPrice)
            countBreads += 1
            return true
        } else {
            return false
        }
    }
    
    func getCountShrimps() -> Int {
        print(countShrimps)
        return countShrimps
    }
    
    func getCountBreads() -> Int {
        print(countBreads)
        return countBreads
    }
    
    func getCountFishes() -> Int {
        print(countFishes)
        return countFishes
    }

  // Функция выдачи текущего уровня лески
    func getCurrentLineLengthLevel() -> Int {
        return lineLengthLevel
    }

  // Функция выдачи текущего уровня крючка
    func getCurrentHookLevel() -> Int {
        return hookLevel
    }
    
    func removeProgress() {
        hookLevel = 1
        lineLengthLevel = 1
        
    }
}
