
import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController!
    var mainViewController: MainViewController!
    var gameViewController: GameViewController!
    var albumViewController: AlbumViewController!
    var shopViewController: ShopViewController!
    
    func start() {
//        showShop()
        showMain()
    }
    
    func showMain() {
        mainViewController = MainViewController()
        mainViewController.coordinator = self
        navigationController.pushViewController(mainViewController, animated: true)
    }
    
    func showGame() {
        gameViewController = GameViewController()
        gameViewController.coordinator = self
        navigationController.pushViewController(gameViewController, animated: true)
    }
    
    func showAlbum() {
        albumViewController = AlbumViewController()
        albumViewController.coordinator = self
        navigationController.pushViewController(albumViewController, animated: true)
    }
    
    func showShop() {
        shopViewController = ShopViewController()
        shopViewController.coordinator = self
        navigationController.pushViewController(shopViewController, animated: true)
    }
    
    func back() {
        navigationController.popViewController(animated: true)
    }
}
