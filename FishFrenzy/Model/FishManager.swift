
import Foundation

class FishesManager {
    private static let defaults = UserDefaults.standard
    private static let fishesKey = "fishes"

    static let shared = FishesManager()

    private init() {
        if let savedFishes = UserDefaults.standard.array(forKey: FishesManager.fishesKey) as? [[String: Any]] {
            fishes = savedFishes.map { dictionary in
                let leftImageName = dictionary["leftImageName"] as? String ?? "fish1Left"
                let rightImageName = dictionary["rightImageName"] as? String ?? "fish1Right"
                let albumImageName = dictionary["albumImageName"] as? String ?? "fish1Opened"
                let closedImageName = dictionary["closedImageName"] as? String ?? "fish1Closed"
                let statusRawValue = dictionary["status"] as? Int ?? FishStatus.common.rawValue
                let isOpened = dictionary["isOpened"] as? Bool ?? true

                return FishData(leftImageName: leftImageName,
                              rightImageName: rightImageName,
                              albumImageName: albumImageName,
                              closedImageName: closedImageName,
                              status: FishStatus(rawValue: statusRawValue)!,
                              isOpened: isOpened)
            }
        } else {
            fishes = createDefaultFishes()
        }
    }

    private(set) var fishes: [FishData] = []

    private func createDefaultFishes() -> [FishData] {
        var defaultFishes: [FishData] = []
        for i in 0..<20 {
            if i >= 0 && i<=5 {
                let fishData = FishData(leftImageName: "fish\(i+1)Left",
                                      rightImageName: "fish\(i+1)Right",
                                      albumImageName: "fish\(i+1)Opened",
                                      closedImageName: "fish\(i+1)Closed",
                                        status: .common,
                                      isOpened: true)
                defaultFishes.append(fishData)
            } else if i > 5 && i <= 10 {
                let fishData = FishData(leftImageName: "fish\(i+1)Left",
                                      rightImageName: "fish\(i+1)Right",
                                      albumImageName: "fish\(i+1)Opened",
                                      closedImageName: "fish\(i+1)Closed",
                                        status: .common,
                                      isOpened: false)
                defaultFishes.append(fishData)
            } else if i > 10 && i < 17 {
                let fishData = FishData(leftImageName: "fish\(i+1)Left",
                                      rightImageName: "fish\(i+1)Right",
                                      albumImageName: "fish\(i+1)Opened",
                                      closedImageName: "fish\(i+1)Closed",
                                        status: .rare,
                                      isOpened: false)
                defaultFishes.append(fishData)
            } else {
                let fishData = FishData(leftImageName: "fish\(i+1)Left",
                                      rightImageName: "fish\(i+1)Right",
                                      albumImageName: "fish\(i+1)Opened",
                                      closedImageName: "fish\(i+1)Closed",
                                        status: .epic,
                                      isOpened: false)
                defaultFishes.append(fishData)
            }
        }
        return defaultFishes
    }

    func getFishData(at index: Int) -> FishData? {
        guard index >= 0 && index < fishes.count else { return nil }
        return fishes[index]
    }


    func changeIsOpenStatus(at index: Int, newStatus: Bool) {
        guard index >= 0 && index < fishes.count else { return }
        fishes[index].isOpened = newStatus
        saveFishes()
    }
    
    func removeProgress() {
        fishes = createDefaultFishes()
        saveFishes()
    }

    private func saveFishes() {
        let encodedFishes = fishes.map {
            ["leftImageName": $0.leftImageName,
             "rightImageName": $0.rightImageName,
             "albumImageName": $0.albumImageName,
             "closedImageName": $0.closedImageName,
             "status": $0.status.rawValue,
             "isOpened": $0.isOpened]
        }
        UserDefaults.standard.set(encodedFishes, forKey: FishesManager.fishesKey)
    }
}
