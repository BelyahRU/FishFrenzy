
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
        label.font =  UIFont(name: "Cherry Bomb One", size: 20)
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
        label.text = "You have: 12"
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
    
    init(type: BiteType) {
        super.init(frame: .zero)
        switch type {
        case .bread:
            biteImage.image = UIImage(named: "biteBread")
        case .fish:
            biteImage.image = UIImage(named: "biteFish")
        case .shrimp:
            biteImage.image = UIImage(named: "biteShrimp")
        }
        
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
        addSubview(biteImage)
        addSubview(biteLvl)
        addSubview(youHave)
        addSubview(priceLabel)
        addSubview(coinImage)
        addSubview(buyButton)
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
        buyButton.snp.makeConstraints { make in
            make.width.equalTo(69)
            make.height.equalTo(44)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
        }
        priceLabel.snp.makeConstraints { make in
            make.trailing.equalTo(buyButton.snp.leading).offset(-12)
            make.centerY.equalToSuperview().offset(-5)
        }
        
        coinImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-5)
            make.trailing.equalTo(priceLabel.snp.leading).offset(-5)
        }
    }
    
    public func updateData() {
        
    }
}
