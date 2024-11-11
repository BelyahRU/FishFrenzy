import Foundation
import UIKit
import SpriteKit

class GameScene: SKScene {

    let fishImagesRight = [
        "fish1Right", "fish2Right", "fish3Right", "fish4Right","fish5Right", "fish6Right","fish7Right","fish8Right","fish9Right","fish10Right","fish11Right","fish12Right","fish13Right","fish14Right","fish15Right","fish16Right","fish17Right","fish18Right","fish19Right","fish20Right"
    ]

    let fishImagesLeft = [
        "fish1Left", "fish2Left", "fish3Left", "fish4Left", "fish5Left","fish6Left","fish7Left","fish8Left","fish9Left","fish10Left","fish11Left","fish12Left","fish13Left","fish14Left","fish15Left","fish16Left","fish17Left","fish18Left","fish19Left","fish20Left"
    ]
    
    var hook: SKSpriteNode! // Замените на имя файла вашей монеты
    var currentHook: HookImageData!


    override func didMove(to view: SKView) {
        super.didMove(to: view)
        setupLevels()
        setupBacks()
        setupHook()
        self.backgroundColor = .clear
        view.isMultipleTouchEnabled = false
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }

        @objc func handleTap(sender: UITapGestureRecognizer) {
            let touchLocation = sender.location(in: self.view)
            print(hook.frame.maxY)
            if touchLocation.x < hook.frame.maxX && touchLocation.x > hook.frame.minX && touchLocation.y > 2532 - hook.frame.maxY && touchLocation.y < 2532 - hook.frame.minY {
                print("contains")
                enumerateChildNodes(withName: "fish") { node, _ in
                    let fish = node as! SKSpriteNode
                    if touchLocation.x < fish.frame.maxX && touchLocation.x > fish.frame.minX && touchLocation.y > 2532 - fish.frame.maxY && touchLocation.y < 2532 - fish.frame.minY {
                        fish.removeFromParent()
                        let fishName = fish.texture?.description.components(separatedBy: " ")[1] ?? "Без имени"
                        let fishNameWithoutDirection = fishName.replacingOccurrences(of: "Left", with: "").replacingOccurrences(of: "Right", with: "")
                        print("Поймана рыба: \(fishNameWithoutDirection)")
                        return
                    }
                }
            }
        }
    
    func setupHook() {
        hook = SKSpriteNode()
        
        hook.size = CGSize(width: currentHook.width, height: currentHook.width)
        hook.position = CGPoint(x: self.frame.midX, y: self.frame.maxY-UIScreen.main.bounds.height / 2)
        hook.zPosition = 10
        addChild(hook)
    }
    
    func setupLevels() {
        spawnFirstFish()
        spawnSecondFish()
        spawnThirdFish()
        spawnFourthFish()
        spawnFifthFish()
        spawnSixthFish()
        spawnSeventhFish()
        spawnEightFish()
        spawnNineFish()
        spawnTenFish()
        spawnElevenFish()
        spawnTwelveFish()
    }
    
    func updateCoinPosition(positionY: CGFloat) {
        UIView.animate(withDuration: 1, animations: {
            self.hook.position = CGPoint(x: self.frame.midX, y: self.frame.maxY - UIScreen.main.bounds.height / 2 - positionY)
        })
            

    }
    
    func setupBacks() {
        let back = SKSpriteNode()
        back.color = .blue
        back.position = CGPoint(x: self.frame.width / 2, y: self.frame.height - (UIScreen.main.bounds.height / 2)-130/2)
        back.size = CGSize(width: self.frame.width, height: 260)
        self.addChild(back)
        let back2 = SKSpriteNode()
        back2.color = .red
        back2.position = CGPoint(x: self.frame.width / 2, y: self.frame.height - (UIScreen.main.bounds.height / 2)-260)
        back2.size = CGSize(width: self.frame.width, height: 130)
        self.addChild(back2)
        let back3 = SKSpriteNode()
        back3.color = .green
        back3.position = CGPoint(x: self.frame.width / 2, y: self.frame.height - (UIScreen.main.bounds.height / 2)-260-130)
        back3.size = CGSize(width: self.frame.width, height: 130)
        self.addChild(back3)
        let back4 = SKSpriteNode()
        back4.color = .gray
        back4.position = CGPoint(x: self.frame.width / 2, y: self.frame.height - (UIScreen.main.bounds.height / 2)-390-130)
        back4.size = CGSize(width: self.frame.width, height: 130)
        self.addChild(back4)
        let back5 = SKSpriteNode()
        back5.color = .darkGray
        back5.position = CGPoint(x: self.frame.width / 2, y: self.frame.height - (UIScreen.main.bounds.height / 2)-390-260)
        back5.size = CGSize(width: self.frame.width, height: 130)
        self.addChild(back5)
        let back6 = SKSpriteNode()
        back6.color = .lightGray
        back6.position = CGPoint(x: self.frame.width / 2, y: self.frame.height - (UIScreen.main.bounds.height / 2)-390-390)
        back6.size = CGSize(width: self.frame.width, height: 130)
        self.addChild(back6)
        let back7 = SKSpriteNode()
        back7.color = .systemGreen
        back7.position = CGPoint(x: self.frame.width / 2, y: self.frame.height - (UIScreen.main.bounds.height / 2)-390-520)
        back7.size = CGSize(width: self.frame.width, height: 130)
        self.addChild(back7)
        let back8 = SKSpriteNode()
        back8.color = .black
        back8.position = CGPoint(x: self.frame.width / 2, y: self.frame.height - (UIScreen.main.bounds.height / 2)-520-520)
        back8.size = CGSize(width: self.frame.width, height: 130)
        self.addChild(back8)
        let back9 = SKSpriteNode()
        back9.color = .systemBlue
        back9.position = CGPoint(x: self.frame.width / 2, y: self.frame.height - (UIScreen.main.bounds.height / 2)-520-650)
        back9.size = CGSize(width: self.frame.width, height: 130)
        self.addChild(back9)
        let back10 = SKSpriteNode()
        back10.color = .brown
        back10.position = CGPoint(x: self.frame.width / 2, y: self.frame.height - (UIScreen.main.bounds.height / 2)-650-650)
        back10.size = CGSize(width: self.frame.width, height: 130)
        self.addChild(back10)
        let back11 = SKSpriteNode()
        back11.color = .systemRed
        back11.position = CGPoint(x: self.frame.width / 2, y: self.frame.height - (UIScreen.main.bounds.height / 2)-650-780)
        back11.size = CGSize(width: self.frame.width, height: 130)
        self.addChild(back11)
        let back12 = SKSpriteNode()
        back12.color = .blue
        back12.position = CGPoint(x: self.frame.width / 2, y: self.frame.height - (UIScreen.main.bounds.height / 2)-780-780)
        back12.size = CGSize(width: self.frame.width, height: 130)
        self.addChild(back12)
    }

    
}

