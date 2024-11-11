
import Foundation
import UIKit

class MainViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    
    let loadingView = LoadingView()
    let mainView = MainView()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mainView.dailyChallengeView.reloadData()
        mainView.coinView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loadingView)
        loadingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
            self.loadingView.isHidden = true
            self.configure()
        }
//        configure()
    }
    
    private func configure() {
        setupUI()
        setupButtons()
    }
    
    private func setupUI() {
        view.addSubview(mainView)
        
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupAchievements() {
        mainView.dailyChallengeView.reloadData()
    }
}
