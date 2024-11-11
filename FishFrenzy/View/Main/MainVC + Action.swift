
import Foundation
import UIKit

extension MainViewController {
    
    func setupButtons() {
        mainView.albumButton.addTarget(self, action: #selector(albumPressed), for: .touchUpInside)
        mainView.goToFishingButton.addTarget(self, action: #selector(goToFishingPressed), for: .touchUpInside)
        mainView.shopButton.addTarget(self, action: #selector(shopPressed), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(achievementsPressed))
        mainView.dailyChallengeView.addGestureRecognizer(tapGesture)

    }
    
    @objc
    func achievementsPressed() {
        coordinator?.showAchievements()
    }

    
    @objc
    func albumPressed() {
        coordinator?.showAlbum()
    }
    
    @objc
    func goToFishingPressed() {
        AchievementsManager.shared.incrementAchievement(index: 3)
        coordinator?.showGame()
    }
    
    @objc
    func shopPressed() {
        coordinator?.showShop()
    }
}
