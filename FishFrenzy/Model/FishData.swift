import Foundation
import UIKit

enum FishStatus: Int {
    case rare = 0
    case epic = 1
    case common = 2
}

struct FishData {
    var leftImageName: String
    var rightImageName: String
    var albumImageName: String
    var closedImageName: String
    var status: FishStatus
    var isOpened: Bool
}
