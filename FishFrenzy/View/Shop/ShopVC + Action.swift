
import Foundation
import UIKit

extension ShopViewController {
    func setupButtons() {
        shopView.homeButton.addTarget(self, action: #selector(homePressed), for: .touchUpInside)
        shopView.hookUpgradeView.upgradeButton.addTarget(self, action: #selector(upgradeHook), for: .touchUpInside)
        shopView.lineUpgradeView.upgradeButton.addTarget(self, action: #selector(upgradeLine), for: .touchUpInside)
        
        shopView.breadView.buyButton.addTarget(self, action: #selector(buyBreadPressed), for: .touchUpInside)
        shopView.shrimpView.buyButton.addTarget(self, action: #selector(buyShrimpPressed), for: .touchUpInside)
        shopView.fishView.buyButton.addTarget(self, action: #selector(buyFishPressed), for: .touchUpInside)
    }
    
    @objc
    func buyBreadPressed() {
        if !viewModel.buyBread() {
            showAlert(title: "Not Enough Coins", message: "You need more coins to purchase more bread. Keep playing to earn more coins!")
        } else {
            reloadLevelsData()
        }
    }
    
    @objc
    func buyFishPressed() {
        if !viewModel.buyFish() {
            showAlert(title: "Not Enough Coins", message: "You need more coins to purchase more fish. Keep playing to earn more coins!")
        } else {
            reloadLevelsData()
        }
    }
    
    @objc
    func buyShrimpPressed() {
        if !viewModel.buyShrimp() {
            showAlert(title: "Not Enough Coins", message: "You need more coins to purchase more shrimp. Keep playing to earn more coins!")
        } else {
            reloadLevelsData()
        }
    }
    
    @objc
    func homePressed() {
        coordinator?.back()
    }
    
    @objc
    func upgradeHook() {
        if !viewModel.buyHook() {
            showAlert(title: "Not Enough Coins", message: "You need more coins to purchase this upgrade. Keep playing to earn more coins!")
        } else {
            AchievementsManager.shared.incrementAchievement(index: 0)
            reloadLevelsData()
        }
    }
    
    @objc
    func upgradeLine() {
        if !viewModel.buyLine() {
            showAlert(title: "Not Enough Coins", message: "You need more coins to purchase this upgrade. Keep playing to earn more coins!")
        } else {
            AchievementsManager.shared.incrementAchievement(index: 0)
            reloadLevelsData()
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else { return }
        rootViewController.present(alert, animated: true, completion: nil)
    }
}
