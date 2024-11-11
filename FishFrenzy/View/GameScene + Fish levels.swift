
import SpriteKit
import Foundation

extension GameScene {
    func spawnFirstFish() {
        spawnFishes(timeIntervalRange: 1...3,
                    randomFishIndexRange: 0...4,
                    spawnHeighRange: (self.size.height-(UIScreen.main.bounds.height / 2)-195)...(self.size.height-(UIScreen.main.bounds.height / 2)+65))
    }
    
    func spawnSecondFish() {
        spawnFishes(timeIntervalRange: 1...3,
                    randomFishIndexRange: 5...8,
                    spawnHeighRange: (self.size.height-(UIScreen.main.bounds.height / 2)-195-130)...(self.size.height-(UIScreen.main.bounds.height / 2)-195))
    }
    
    func spawnThirdFish() {
        spawnFishes(timeIntervalRange: 3...4,
                    randomFishIndexRange: 6...9,
                    spawnHeighRange: (self.size.height-(UIScreen.main.bounds.height / 2)-195-260)...(self.size.height-(UIScreen.main.bounds.height / 2)-195-130))
    }
    
    func spawnFourthFish() {
        spawnFishes(timeIntervalRange: 2...4,
                    randomFishIndexRange: 3...7,
                    spawnHeighRange: (self.size.height-(UIScreen.main.bounds.height / 2)-195-390)...(self.size.height-(UIScreen.main.bounds.height / 2)-195-260))
    }
    
    func spawnFifthFish() {
        spawnFishes(timeIntervalRange: 2...4,
                    randomFishIndexRange: 9...10,
                    spawnHeighRange: (self.size.height-(UIScreen.main.bounds.height / 2)-195-520)...(self.size.height-(UIScreen.main.bounds.height / 2)-195-390))
    }
    func spawnSixthFish() {
        spawnFishes(timeIntervalRange: 2...5,
                    randomFishIndexRange: 9...12,
                    spawnHeighRange: (self.size.height-(UIScreen.main.bounds.height / 2)-195-650)...(self.size.height-(UIScreen.main.bounds.height / 2)-195-520))
    }
    
    func spawnSeventhFish() {
        spawnFishes(timeIntervalRange: 1...3,
                    randomFishIndexRange: 1...12,
                    spawnHeighRange: (self.size.height-(UIScreen.main.bounds.height / 2)-195-780)...(self.size.height-(UIScreen.main.bounds.height / 2)-195-650))
    }
    
    func spawnEightFish() {
        spawnFishes(timeIntervalRange: 3...6,
                    randomFishIndexRange: 12...14,
                    spawnHeighRange: (self.size.height-(UIScreen.main.bounds.height / 2)-195-910)...(self.size.height-(UIScreen.main.bounds.height / 2)-195-780))
    }
    
    func spawnNineFish() {
        spawnFishes(timeIntervalRange: 2...8,
                    randomFishIndexRange: 10...15,
                    spawnHeighRange: (self.size.height-(UIScreen.main.bounds.height / 2)-195-1040)...(self.size.height-(UIScreen.main.bounds.height / 2)-195-910))
    }
    
    func spawnTenFish() {
        spawnFishes(timeIntervalRange: 2...5,
                    randomFishIndexRange: 13...16,
                    spawnHeighRange: (self.size.height-(UIScreen.main.bounds.height / 2)-195-1170)...(self.size.height-(UIScreen.main.bounds.height / 2)-195-1040))
    }
    
    func spawnElevenFish() {
        spawnFishes(timeIntervalRange: 4...7,
                    randomFishIndexRange: 16...18,
                    spawnHeighRange: (self.size.height-(UIScreen.main.bounds.height / 2)-195-1300)...(self.size.height-(UIScreen.main.bounds.height / 2)-195-1170))
    }
    
    func spawnTwelveFish() {
        spawnFishes(timeIntervalRange: 8...10,
                    randomFishIndexRange: 18...19,
                    spawnHeighRange: (self.size.height-(UIScreen.main.bounds.height / 2)-195-1430)...(self.size.height-(UIScreen.main.bounds.height / 2)-195-1300))
    }
    
    func spawnFishes(timeIntervalRange:ClosedRange<TimeInterval>, randomFishIndexRange: ClosedRange<Int>, spawnHeighRange: ClosedRange<CGFloat>){
        let spawnDelay = TimeInterval.random(in: timeIntervalRange)
        DispatchQueue.main.asyncAfter(deadline: .now() + spawnDelay) {
            
            let randomFishIndex = Int.random(in: randomFishIndexRange)

            let spawnHeight = CGFloat.random(in: spawnHeighRange)

            let direction = Bool.random() ? 1 : -1

            let fish = SKSpriteNode(imageNamed: direction == 1 ? self.fishImagesRight[randomFishIndex] : self.fishImagesLeft[randomFishIndex])

            fish.position = CGPoint(x: direction == 1 ? -fish.size.width : self.size.width + fish.size.width, y: spawnHeight)
            fish.size = CGSize(width: 100, height: 100)
            fish.name = "fish"
            self.addChild(fish)
            let moveAction = SKAction.move(to: CGPoint(x: direction == 1 ? self.size.width + fish.size.width : -fish.size.width, y: spawnHeight), duration: 3)
            let removeAction = SKAction.removeFromParent()
            let sequenceAction = SKAction.sequence([moveAction, removeAction])

            fish.run(sequenceAction)
            self.spawnFishes(timeIntervalRange: timeIntervalRange, randomFishIndexRange: randomFishIndexRange, spawnHeighRange: spawnHeighRange)
        }
    }
}
