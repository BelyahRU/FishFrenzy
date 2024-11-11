import UIKit
import SpriteKit
import Foundation
import SnapKit

class GameViewController: UIViewController, UIScrollViewDelegate {

    weak var coordinator: MainCoordinator?
    let viewModel = GameViewModel()

    var scrollView: UIScrollView!
    var skView: SKView!
    var gameScene: GameScene!
    let imageView2 = UIImageView(image: UIImage(named: Resources.Back.gameBackground))
    let hookImage = UIImageView()
    let lineImage = UIView()
    let lowerButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "lowerButton"), for: .normal)
        button.backgroundColor = .clear
        return button
    }()

    let pullUpButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "pullUpButton"), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    let targetView = TargetView()
    var blocks: [UIImageView] = []
    var currentHeight = 1
    var maxHeight = 1
    var hookLevel = 1
    
    let changeBitesView = ChangeBitesView()
    let pauseView = PauseView()
    var currentBite = "bread"
    
    let biteButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "breadBite"), for: .normal)
        button.isHidden = false
        return button
    }()
    
    let pauseButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "pauseButton"), for: .normal)
        return button
    }()
    
    let countBites: UILabel = {
        let label = UILabel()
         label.font =  UIFont(name: "Cherry Bomb One", size: 18)
         label.textColor = .white
         label.textAlignment = .left
         label.text = "x\(ShopManager.shared.countBreads)"
         return label
     }()
    
    let coinsView = CoinsView()
    var blurView: UIVisualEffectView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    func configure() {
        setupGameScene()
        setupButtons()
        setupViewModel()
        scrollView.isScrollEnabled = false
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCoins), name: NSNotification.Name("reloadCoins"), object: nil)
    }

    @objc
    func reloadCoins() {
        coinsView.reloadData()
        if currentBite == "bread" {
            countBites.text = "x\(ShopManager.shared.countBreads)"
        } else if currentBite == "shrimp" {
            countBites.text = "x\(ShopManager.shared.countShrimps)"
        } else if currentBite == "fish" {
            countBites.text = "x\(ShopManager.shared.countFishes)"
        }
    }
    
    
    func setupViewModel() {
        maxHeight = viewModel.getMaxLineHeight()
        changeBitesView.shrimpView.updateData(currentCount: viewModel.getCountShrimps())
        changeBitesView.breadView.updateData(currentCount: viewModel.getCountBreads())
        changeBitesView.fishView.updateData(currentCount: viewModel.getCountFishes())
    }

    func setupGameScene() {
        scrollView = UIScrollView(frame: view.frame)
        view.addSubview(scrollView)
        imageView2.contentMode = .scaleAspectFill
        scrollView.contentInset = UIEdgeInsets(top: -60, left: 0, bottom: -60, right: 0)
        scrollView.addSubview(imageView2)
        imageView2.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        skView = SKView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 2532))
        scrollView.addSubview(skView)
        skView.backgroundColor = .clear
        
        gameScene = GameScene(size: CGSize(width: view.bounds.width, height: 2532))
        gameScene.backgroundColor = .clear
        gameScene.currentHook = viewModel.getCurrentHook()
        hookImage.image = UIImage(named: viewModel.getCurrentHook().name)
        skView.presentScene(gameScene)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 2532)
        scrollView.delegate = self

        view.addSubview(lowerButton)
        view.addSubview(pullUpButton)
        view.addSubview(pauseButton)
        view.addSubview(biteButton)
        view.addSubview(countBites)
        view.addSubview(coinsView)

        lowerButton.snp.makeConstraints { make in
            make.width.equalTo(172)
            make.height.equalTo(92)
            make.bottom.equalToSuperview().offset(-18)
            make.leading.equalToSuperview().offset(5)
        }

        pullUpButton.snp.makeConstraints { make in
            make.width.equalTo(172)
            make.height.equalTo(92)
            make.bottom.equalToSuperview().offset(-18)
            make.trailing.equalToSuperview().offset(-5)
        }
        
        pauseButton.snp.makeConstraints { make in
            make.size.equalTo(60)
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(25)
        }
        coinsView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(60)
            make.width.equalTo(150)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(25)
        }
        

        // Размещаем блоки
        let blockWidth: CGFloat = 28
        let blockHeight: CGFloat = 128
        let rightMargin: CGFloat = 15

        // Создаем блоки
        for i in 0..<14 {
            let block = createBlock(x: view.bounds.width - blockWidth - rightMargin, y: self.view.frame.height / 2 - blockHeight / 2 + CGFloat(i) * blockHeight, width: blockWidth, height: blockHeight)
            scrollView.addSubview(block)
            blocks.append(block)
        }

        view.addSubview(targetView)
        targetView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-60)
            make.width.equalTo(35)
            make.height.equalTo(60)
            make.centerY.equalToSuperview()
        }
        targetView.changeTitle(num: 15)
        lineImage.backgroundColor = .white
        view.addSubview(lineImage)
        
        lineImage.snp.makeConstraints { make in
            make.width.equalTo(2)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.view.snp.centerY)
        }
        view.addSubview(hookImage)
        
        hookImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(viewModel.getCurrentHook().width)
        }
        
        scrollView.addObserver(self, forKeyPath: "contentOffset", options: .new, context: nil)
        let blurEffect = UIBlurEffect(style: .prominent)
        blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.frame// Устанавливаем размер размытия на размер кнопки
        view.addSubview(blurView) //
        blurView.isHidden = true
        view.addSubview(changeBitesView)
        changeBitesView.snp.makeConstraints { make in
            make.height.equalTo(446)
            make.width.equalTo(350)
            make.center.equalToSuperview()
        }
        view.addSubview(pauseView)
        pauseView.snp.makeConstraints { make in
            make.width.equalTo(240)
            make.height.equalTo(318+16+52+10)
            make.center.equalToSuperview()
        }
        pauseView.isHidden = true
        changeBitesView.isHidden = true
        changeBitesView.breadView.changeButton.isHidden = true
        changeBitesView.breadView.isActiveLabel.isHidden = false
        
        biteButton.snp.makeConstraints { make in
            make.size.equalTo(60)
            make.bottom.equalTo(lowerButton.snp.top).offset(-20)
            make.leading.equalToSuperview().offset(24)
        }
        
        countBites.snp.makeConstraints { make in
            make.leading.equalTo(biteButton.snp.trailing).offset(5)
            make.centerY.equalTo(biteButton.snp.centerY)
        }
    }

    func createBlock(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> UIImageView {
        let block = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
        block.image = UIImage(named: "blockImage")
        return block
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "contentOffset" {
            let scrollOffset = scrollView.contentOffset.y + self.view.frame.height / 2
            for (index, block) in blocks.enumerated() {
                if scrollOffset >= block.frame.minY && scrollOffset < block.frame.maxY {
                    targetView.changeTitle(num: 15 + index * 5)
                    gameScene.updateCoinPosition(positionY: scrollView.contentOffset.y)
                    break
                }
            }
        }
    }

    deinit {
        scrollView.removeObserver(self, forKeyPath: "contentOffset")
    }
}
