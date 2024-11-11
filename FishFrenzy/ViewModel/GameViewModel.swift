
import Foundation

struct HookImageData {
    let name: String
    let width: CGFloat
}

class GameViewModel {
    
    let shopManager = ShopManager.shared
    
    func getMaxLineHeight() -> Int {
        let lineHeightLevel = shopManager.getCurrentLineLengthLevel()
        if lineHeightLevel == 1 {
            return 2
        } else {
            return lineHeightLevel + 2
        }
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
    
    func getCurrentHook() -> HookImageData {
        let hookLevel = shopManager.getCurrentHookLevel()
//        let hookLevel = 5
//        
        switch hookLevel {
        case 1:
            return HookImageData(name: "hook1", width: 108)
        case 2:
            return HookImageData(name: "hook2", width: 168)
        case 3:
            return HookImageData(name: "hook3", width: 228)
        case 4:
            return HookImageData(name: "hook4", width: 288)
        case 5:
            return HookImageData(name: "hook5", width: 348)
        case 6:
            return HookImageData(name: "hook6", width: 408)
        case 7:
            return HookImageData(name: "hook7", width: 468)
        case 8:
            return HookImageData(name: "hook8", width: 528)
        case 9:
            return HookImageData(name: "hook9", width: 588)
        default:
            return HookImageData(name: "hook10", width: 648)
        }
    }
}
