
import Foundation
import UIKit

class ShopViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    
    let shopView = ShopView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        setupUI()
        setupButtons()
    }
    
    private func setupUI() {
        view.addSubview(shopView)
        
        shopView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
