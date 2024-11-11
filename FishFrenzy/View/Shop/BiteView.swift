
import Foundation
import UIKit

enum BiteType {
    case bread
    case fish
    case shrimp
}

class BiteView: UIView {
    
    private let back = UIImageView(image:
                        UIImage(named: Resources.Back.biteBack))
    private let biteImage: UIImageView = {
       let im = UIImageView()
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    private let biteLvl: UILabel = {
       let label = UILabel()
        label.font =  UIFont(name: "Cherry Bomb One", size: 14)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "Bite 1 Lvl"
        return label
    }()
    
    private let youHave: UILabel = {
       let label = UILabel()
        label.font =  UIFont(name: "Cherry Bomb One", size: 15)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
         label.font =  UIFont(name: "Cherry Bomb One", size: 18)
         label.textColor = .white
         label.textAlignment = .left
         label.text = "200"
         return label
     }()
    
    private let coinImage: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: Resources.Views.coin)
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    public let buyButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.buyButton), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    public let changeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "changeButton"), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    public let isActiveLabel: UILabel = {
       let label = UILabel()
        label.font =  UIFont(name: "Cherry Bomb One", size: 18)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Active"
        return label
    }()
    
    init(type: BiteType, isGame: Bool) {
        super.init(frame: .zero)
        switch type {
        case .bread:
            biteImage.image = UIImage(named: "biteBread")
        case .fish:
            biteImage.image = UIImage(named: "biteFish")
        case .shrimp:
            biteImage.image = UIImage(named: "biteShrimp")
        }
        if !isGame {
            addSubview(buyButton)
            buyButton.snp.makeConstraints { make in
                make.width.equalTo(69)
                make.height.equalTo(44)
                make.centerY.equalToSuperview()
                make.trailing.equalToSuperview().offset(-16)
            }
            configure()
            self.bringSubviewToFront(buyButton)
            addSubview(priceLabel)
            addSubview(coinImage)
            priceLabel.snp.makeConstraints { make in
                make.trailing.equalTo(buyButton.snp.leading).offset(-1)
                make.centerY.equalToSuperview().offset(-5)
            }
            
            coinImage.snp.makeConstraints { make in
                make.centerY.equalToSuperview().offset(-5)
                make.trailing.equalTo(priceLabel.snp.leading).offset(-2)
            }
        } else {
            addSubview(isActiveLabel)
            addSubview(changeButton)
            isActiveLabel.snp.makeConstraints { make in
                make.centerY.equalToSuperview().offset(-5)
                make.trailing.equalToSuperview().offset(-22)
            
            }
            
            changeButton.snp.makeConstraints { make in
                make.width.equalTo(92)
                make.height.equalTo(44)
                make.centerY.equalToSuperview()
                make.trailing.equalToSuperview().offset(-16)
            }
            configure()
            self.bringSubviewToFront(isActiveLabel)
            isActiveLabel.isHidden = true
            self.bringSubviewToFront(changeButton)
            
            
        }
        
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
        addSubview(biteImage)
        addSubview(biteLvl)
        addSubview(youHave)
    }
    
    private func setupConstraints() {
        back.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        biteImage.snp.makeConstraints { make in
            make.size.equalTo(52)
            make.centerY.equalToSuperview().offset(-3)
            make.leading.equalToSuperview().offset(16)
        }
        biteLvl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalTo(biteImage.snp.trailing).offset(12)
        }
        youHave.snp.makeConstraints { make in
            make.top.equalTo(biteLvl.snp.bottom).offset(-4)
            make.leading.equalTo(biteImage.snp.trailing).offset(12)
        }
        
    }
    
    public func updateBitelevelData(levelData: String, price: String) {
        biteLvl.text = "Bite for \(levelData)"
        priceLabel.text = "\(price)"
    }
    
    public func updateData(currentCount: Int) {
        youHave.text = "You have: \(currentCount)"
    }
}
