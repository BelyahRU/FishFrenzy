
import Foundation
import UIKit

class AlbumViewModel {
    let fishManager = FishesManager.shared
    
    func getCountFishes() -> Int {
        return fishManager.fishes.count
    }
    
    func getFish(by id: Int) -> FishData? {
        if id >= 0 && id <= 19 {
            return fishManager.getFishData(at: id)!
        } else {
            return nil
        }
        
    }
}
