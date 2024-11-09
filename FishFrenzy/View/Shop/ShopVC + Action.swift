
import Foundation
import UIKit

extension ShopViewController {
    func setupButtons() {
        shopView.homeButton.addTarget(self, action: #selector(homePressed), for: .touchUpInside)
    }
    
    @objc
    func homePressed() {
        coordinator?.back()
    }
}
