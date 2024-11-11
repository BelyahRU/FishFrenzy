
import Foundation
import UIKit

class AchievementsViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    let achievementsView = AchievementsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupButtons()
        setupViewModel()
    }
    
    private func setupUI() {
        view.addSubview(achievementsView)
        achievementsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupViewModel() {
        let achievements = AchievementsManager.shared.getAchievementsProgress()
        
        achievementsView.buyAnyUpgrade.setupUI(title: achievements[0].title, total: achievements[0].progress, isClaimed: achievements[0].isClaimed)
        achievementsView.catch5Fishes.setupUI(title: achievements[1].title, total: achievements[1].progress, isClaimed: achievements[1].isClaimed)
        achievementsView.use3Types.setupUI(title: achievements[2].title, total: achievements[2].progress, isClaimed: achievements[2].isClaimed)
        achievementsView.play10Times.setupUI(title: achievements[3].title, total: achievements[3].progress, isClaimed: achievements[3].isClaimed)
        achievementsView.catch1Fich.setupUI(title: achievements[4].title, total: achievements[4].progress, isClaimed: achievements[4].isClaimed)
    }
}
