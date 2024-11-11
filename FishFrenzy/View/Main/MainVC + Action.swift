
import Foundation
import UIKit

extension MainViewController {
    
    func setupButtons() {
        mainView.albumButton.addTarget(self, action: #selector(albumPressed), for: .touchUpInside)
        mainView.goToFishingButton.addTarget(self, action: #selector(goToFishingPressed), for: .touchUpInside)
        mainView.shopButton.addTarget(self, action: #selector(shopPressed), for: .touchUpInside)
    }
    
    @objc
    func albumPressed() {
        coordinator?.showAlbum()
    }
    
    @objc
    func goToFishingPressed() {
        coordinator?.showGame()
    }
    
    @objc
    func shopPressed() {
        coordinator?.showShop()
    }
}
