
import Foundation
import UIKit

class ShopViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    
    let shopView = ShopView()
    let viewModel = ShopViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        setupUI()
        setupButtons()
        reloadLevelsData()
    }
    
    private func setupUI() {
        view.addSubview(shopView)
        
        shopView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    public func reloadLevelsData() {
        shopView.hookUpgradeView.updateLevel(level: "\(viewModel.getHookLevel())")
        shopView.lineUpgradeView.updateLevel(level: "\(viewModel.getLineLevel())")
        shopView.coinView.reloadData()
        shopView.shrimpView.updateData(currentCount: viewModel.getCountShrimps())
        shopView.breadView.updateData(currentCount: viewModel.getCountBreads())
        shopView.fishView.updateData(currentCount: viewModel.getCountFishes())
    }
}
