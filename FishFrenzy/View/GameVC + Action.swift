

import Foundation
import UIKit

extension GameViewController {
    func setupButtons() {
        lowerButton.addTarget(self, action: #selector(lowerButtonTapped), for: .touchUpInside)
        pullUpButton.addTarget(self, action: #selector(pullUpButtonTapped), for: .touchUpInside)
        changeBitesView.breadView.changeButton.addTarget(self, action: #selector(selectBreadPressed), for: .touchUpInside)
        changeBitesView.shrimpView.changeButton.addTarget(self, action: #selector(selectShrimpPressed), for: .touchUpInside)
        changeBitesView.fishView.changeButton.addTarget(self, action: #selector(selectFishPressed), for: .touchUpInside)
        changeBitesView.cancelButton.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        
        biteButton.addTarget(self, action: #selector(bitePressed), for: .touchUpInside)
        pauseButton.addTarget(self, action: #selector(pausePressed), for: .touchUpInside)
        pauseView.cancelButton.addTarget(self, action: #selector(cancelPausePressed), for: .touchUpInside)
        pauseView.continueButton.addTarget(self, action: #selector(cancelPausePressed), for: .touchUpInside)
        pauseView.backHomeButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
    }
    
    @objc
    func backPressed() {
        coordinator?.back()
    }
    
    @objc
    func pausePressed() {
        pauseView.isHidden = false
        blurView.isHidden = false
        gameScene.isPaused = true
    }
    
    @objc
    func cancelPausePressed() {
        pauseView.isHidden = true
        blurView.isHidden = true
        gameScene.isPaused = false
    }
    
    @objc
    func cancelPressed() {
        UIView.animate(withDuration: 0.5) {
            self.changeBitesView.isHidden = true
            self.blurView.isHidden = true
        }
        gameScene.isPaused = false
    }
    
    @objc
    func bitePressed() {
        if !blurView.isHidden {
            UIView.animate(withDuration: 0.5) {
                self.changeBitesView.isHidden = true
                self.blurView.isHidden = true
            }
            gameScene.isPaused = false
        } else {
            setupViewModel()
            UIView.animate(withDuration: 0.5) {
                self.changeBitesView.isHidden = false
                self.blurView.isHidden = false
            }
            gameScene.isPaused = true
        }
        
    }
    
    @objc
    func selectFishPressed() {
        currentBite = "fish"
        gameScene.currentBite = "fish"
        AchievementsManager.shared.incrementAchievement(index: 2)
        countBites.text = "x\(ShopManager.shared.countFishes)"
        biteButton.setImage(UIImage(named: "fishBite"), for: .normal)
        changeBitesView.breadView.changeButton.isHidden = false
        changeBitesView.breadView.isActiveLabel.isHidden = true
        changeBitesView.shrimpView.changeButton.isHidden = false
        changeBitesView.shrimpView.isActiveLabel.isHidden = true
        changeBitesView.fishView.changeButton.isHidden = true
        changeBitesView.fishView.isActiveLabel.isHidden = false
    }
    
    @objc
    func selectBreadPressed() {
        currentBite = "bread"
        gameScene.currentBite = "bread"
        AchievementsManager.shared.incrementAchievement(index: 2)
        countBites.text = "x\(ShopManager.shared.countBreads)"
        biteButton.setImage(UIImage(named: "breadBite"), for: .normal)
        changeBitesView.breadView.changeButton.isHidden = true
        changeBitesView.breadView.isActiveLabel.isHidden = false
        
        changeBitesView.shrimpView.changeButton.isHidden = false
        changeBitesView.shrimpView.isActiveLabel.isHidden = true
        
        changeBitesView.fishView.changeButton.isHidden = false
        changeBitesView.fishView.isActiveLabel.isHidden = true
    }
    
    @objc
    func selectShrimpPressed() {
        currentBite = "shrimp"
        gameScene.currentBite = "shrimp"
        AchievementsManager.shared.incrementAchievement(index: 2)
        countBites.text = "x\(ShopManager.shared.countShrimps)"
        biteButton.setImage(UIImage(named: "shrimpBite"), for: .normal)
        changeBitesView.breadView.changeButton.isHidden = false
        changeBitesView.breadView.isActiveLabel.isHidden = true
        
        changeBitesView.shrimpView.changeButton.isHidden = true
        changeBitesView.shrimpView.isActiveLabel.isHidden = false
        
        changeBitesView.fishView.changeButton.isHidden = false
        changeBitesView.fishView.isActiveLabel.isHidden = true
    }
    
    @objc func lowerButtonTapped() {
        let maxContentOffset = scrollView.contentSize.height - scrollView.frame.height
        if scrollView.contentOffset.y < maxContentOffset - 130 && currentHeight < maxHeight{
            UIView.animate(withDuration: 0.3, animations: {
                let newContentOffset = CGPoint(x: self.scrollView.contentOffset.x, y: self.scrollView.contentOffset.y + 128)
                self.scrollView.setContentOffset(newContentOffset, animated: false)
            })
            currentHeight += 1
        }
    }
    
    @objc func pullUpButtonTapped() {
        if scrollView.contentOffset.y > 100  {
            UIView.animate(withDuration: 0.3, animations: {
                let newContentOffset = CGPoint(x: self.scrollView.contentOffset.x, y: self.scrollView.contentOffset.y - 128)
                self.scrollView.setContentOffset(newContentOffset, animated: false)
            })
            currentHeight -= 1
        }
    }
}
