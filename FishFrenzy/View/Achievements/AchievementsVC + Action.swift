
import Foundation
import UIKit

extension AchievementsViewController {
    func setupButtons() {
        achievementsView.homeButton.addTarget(self, action: #selector(homePressed), for: .touchUpInside)
        
        achievementsView.catch5Fishes.claimButton.addTarget(self, action: #selector(catch1), for: .touchUpInside)
        
        achievementsView.use3Types.claimButton.addTarget(self, action: #selector(catch2), for: .touchUpInside)
        
        achievementsView.buyAnyUpgrade.claimButton.addTarget(self, action: #selector(catch0), for: .touchUpInside)
        achievementsView.play10Times.claimButton.addTarget(self, action: #selector(catch3), for: .touchUpInside)
        achievementsView.catch1Fich.claimButton.addTarget(self, action: #selector(catch4), for: .touchUpInside)
    }
    
    @objc
    func homePressed() {
        coordinator?.back()
    }
    
    @objc
    func catch0() {
        AchievementsManager.shared.claiming(index: 0)
        achievementsView.buyAnyUpgrade.claimButton.isHidden = true
        achievementsView.buyAnyUpgrade.claimedButton.isHidden = false
        CoinsManager.shared.addCoins(amount: 50)
        achievementsView.coinView.reloadData()
    }
    @objc
    func catch1() {
        AchievementsManager.shared.claiming(index: 1)
        achievementsView.catch5Fishes.claimButton.isHidden = true
        achievementsView.catch5Fishes.claimedButton.isHidden = false
        CoinsManager.shared.addCoins(amount: 50)
        achievementsView.coinView.reloadData()
    }
    @objc
    func catch2() {
        AchievementsManager.shared.claiming(index: 2)
        achievementsView.use3Types.claimButton.isHidden = true
        achievementsView.use3Types.claimedButton.isHidden = false
        CoinsManager.shared.addCoins(amount: 50)
        achievementsView.coinView.reloadData()
    }
    @objc
    func catch3() {
        AchievementsManager.shared.claiming(index: 3)
        achievementsView.play10Times.claimButton.isHidden = true
        achievementsView.play10Times.claimedButton.isHidden = false
        CoinsManager.shared.addCoins(amount: 50)
        achievementsView.coinView.reloadData()
    }
    @objc
    func catch4() {
        AchievementsManager.shared.claiming(index: 4)
        achievementsView.catch1Fich.claimButton.isHidden = true
        achievementsView.catch1Fich.claimedButton.isHidden = false
        CoinsManager.shared.addCoins(amount: 50)
        achievementsView.coinView.reloadData()
    }
}
