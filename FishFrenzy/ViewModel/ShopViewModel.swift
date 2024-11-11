
import Foundation

class ShopViewModel {
    
    private let shopManager = ShopManager.shared
    
    func buyHook() -> Bool {
        return shopManager.buyHookUpgrade()
    }
    
    func buyLine() -> Bool {
        return shopManager.buyLineLengthUpgrade()
    }
    
    func buyShrimp() -> Bool {
        return shopManager.buyShrimp()
    }
    
    func buyFish() -> Bool {
        return shopManager.buyFish()
    }
    
    func buyBread() -> Bool {
        return shopManager.buyBread()
    }
    
    func getLineLevel() -> Int {
        return shopManager.getCurrentLineLengthLevel()
    }
    
    func getHookLevel() -> Int {
        return shopManager.getCurrentHookLevel()
    }
    
    func getCountShrimps() -> Int {
        return shopManager.getCountShrimps()
    }
    
    func getCountBreads() -> Int {
        return shopManager.getCountBreads()
    }
    
    func getCountFishes() -> Int {
        return shopManager.getCountFishes()
    }
}
