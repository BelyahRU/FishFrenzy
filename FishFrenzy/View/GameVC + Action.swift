

import Foundation
import UIKit

extension GameViewController {
    func setupButtons() {
        lowerButton.addTarget(self, action: #selector(lowerButtonTapped), for: .touchUpInside)
        pullUpButton.addTarget(self, action: #selector(pullUpButtonTapped), for: .touchUpInside)
        changeBitesView.breadView.changeButton.addTarget(self, action: #selector(selectBreadPressed), for: .touchUpInside)
        changeBitesView.shrimpView.changeButton.addTarget(self, action: #selector(selectShrimpPressed), for: .touchUpInside)
        changeBitesView.fishView.changeButton.addTarget(self, action: #selector(selectFishPressed), for: .touchUpInside)
    }
    
    @objc
    func selectFishPressed() {
        currentBite = "fish"
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
