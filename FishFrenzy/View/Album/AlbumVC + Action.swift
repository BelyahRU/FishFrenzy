
import Foundation
import UIKit

extension AlbumViewController {
    
    func setupButtons() {
        albumView.homeButton.addTarget(self, action: #selector(homePressed), for: .touchUpInside)
    }
    
    @objc
    func homePressed() {
        coordinator?.back()
    }
}
