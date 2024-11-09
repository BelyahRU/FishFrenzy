
import Foundation
import UIKit

class ShopView: UIView {
    
    private let back = UIImageView(image:
                                    UIImage(named: Resources.Back.mainBackground))
    public let coinView = CoinsView()
    
    public let homeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.homeButton), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    private let shopLabelImage: UIImageView = {
       let im = UIImageView()
        im.image = UIImage(named: Resources.Labels.shopLabel)
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    public let shrimpView = BiteView(type: .shrimp)
    public let fishView = BiteView(type: .fish)
    public let breadView = BiteView(type: .bread)
    public let hookUpgradeView = UpgradesView(type: .hook)
    public let lineUpgradeView = UpgradesView(type: .line)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        addSubview(back)
        addSubview(coinView)
        addSubview(homeButton)
        addSubview(shopLabelImage)
        addSubview(shrimpView)
        addSubview(fishView)
        addSubview(breadView)
        addSubview(lineUpgradeView)
        addSubview(hookUpgradeView)
    }
    
    private func setupConstraints() {
        back.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        coinView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(60)
            make.width.equalTo(150)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(25)
        }
        
        homeButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.size.equalTo(60)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(25)
        }
        
        shopLabelImage.snp.makeConstraints { make in
            make.top.equalTo(homeButton.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(60)
        }
        
        shrimpView.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(84)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-54)
        }
        
        fishView.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(84)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(shrimpView.snp.top).offset(-12)
        }
        
        breadView.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(84)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(fishView.snp.top).offset(-12)
        }
        
        lineUpgradeView.snp.makeConstraints { make in
            make.width.equalTo(169)
            make.height.equalTo(264)
            make.top.equalTo(shopLabelImage.snp.bottom).offset(5)
            make.trailing.equalToSuperview().offset(-self.frame.width / 2 + 5)
        }
        
        hookUpgradeView.snp.makeConstraints { make in
            make.width.equalTo(169)
            make.height.equalTo(264)
            make.top.equalTo(shopLabelImage.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(self.frame.width / 2 - 5)
        }
    }
}
