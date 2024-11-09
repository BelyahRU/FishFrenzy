
import Foundation
import UIKit

enum UpgradesType {
    case line
    case hook
}

class UpgradesView: UIView {
    
    private let back = UIImageView()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
         label.font =  UIFont(name: "Cherry Bomb One", size: 22)
         label.textColor = .white
         label.textAlignment = .center
         return label
     }()
    
    private let image: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let currentLvlLabel: UILabel = {
        let label = UILabel()
         label.font =  UIFont(name: "Cherry Bomb One", size: 18)
         label.textColor = .white
         label.textAlignment = .center
         label.text = "Level 1"
         return label
     }()
    
    public let upgradeButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.upgradeButton), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    public let maxLevelButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.maxLevelButton), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
         label.font =  UIFont(name: "Cherry Bomb One", size: 18)
         label.textColor = .white
         label.textAlignment = .left
         label.text = "150"
         return label
     }()
    
    private let coinImage: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: Resources.Views.coin)
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    init(type: UpgradesType) {
        super.init(frame: .zero)
        switch type {
        case .line:
            image.image = UIImage(named: Resources.Views.line)
            nameLabel.text = "Line Lenght"
            configureHigh()
        case .hook:
            image.image = UIImage(named: Resources.Views.hook)
            nameLabel.text = "Hook Radius"
            configureLow()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLow() {
        back.image = UIImage(named: Resources.Back.lowUpgradesBack)
        addSubview(back)
        addSubview(nameLabel)
        addSubview(currentLvlLabel)
        addSubview(image)
        addSubview(maxLevelButton)
        
        back.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(234)
            make.width.equalTo(163)
        }
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(12)
        }
        currentLvlLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(38)
        }
        image.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.centerX.equalToSuperview()
            make.top.equalTo(currentLvlLabel.snp.bottom).offset(5)
        }
        maxLevelButton.snp.makeConstraints { make in
            make.width.equalTo(137)
            make.height.equalTo(44)
            make.bottom.equalToSuperview().offset(-19)
            make.centerX.equalToSuperview()
        }
    }
    
    private func configureHigh() {
        back.image = UIImage(named: Resources.Back.highUpgradesBack)
        addSubview(back)
        addSubview(nameLabel)
        addSubview(currentLvlLabel)
        addSubview(image)
        addSubview(upgradeButton)
        addSubview(coinImage)
        addSubview(priceLabel)
        
        back.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(234)
            make.width.equalTo(163)
        }
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(12)
        }
        currentLvlLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(38)
        }
        image.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.centerX.equalToSuperview()
            make.top.equalTo(currentLvlLabel.snp.bottom).offset(5)
        }
        upgradeButton.snp.makeConstraints { make in
            make.width.equalTo(137)
            make.height.equalTo(44)
            make.bottom.equalToSuperview().offset(-43)
            make.centerX.equalToSuperview()
        }
        coinImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-self.frame.width / 2)
            make.bottom.equalToSuperview().offset(-8)
        }
        priceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(self.frame.width / 2)
            make.centerY.equalTo(coinImage)
        }
    }
}
