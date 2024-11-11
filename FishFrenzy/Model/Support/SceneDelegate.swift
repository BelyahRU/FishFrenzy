
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController!
    var mainCoordinator: MainCoordinator!


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
//        ShopManager.shared.removeProgress()
        start()
    }

    func start() {
        navigationController = UINavigationController()
        navigationController.navigationBar.isHidden = true
        mainCoordinator = MainCoordinator()
        window?.rootViewController = navigationController
        mainCoordinator.navigationController = navigationController
        mainCoordinator.start()
        window?.makeKeyAndVisible()
    }


}

