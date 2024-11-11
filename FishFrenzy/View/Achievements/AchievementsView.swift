
import Foundation
import UIKit

class AchievementsView: UIView {
    
    private let back = UIImageView(image:
                                    UIImage(named: Resources.Back.mainBackground))
    public let coinView = CoinsView()
    
    public let homeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.homeButton), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    
    
    private let achievementsLabelView: UIImageView = {
       let im = UIImageView()
        im.image = UIImage(named: "achievementsLabelView")
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    public let catch5Fishes = AchieveView()
    public let use3Types = AchieveView()
    public let buyAnyUpgrade = AchieveView()
    public let play10Times = AchieveView()
    public let catch1Fich = AchieveView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() {
        setupSubviews()
        setupConstraints()
    }
    
    func setupSubviews() {
        addSubview(back)
        addSubview(coinView)
        addSubview(homeButton)
        addSubview(achievementsLabelView)
        addSubview(achievementsLabelView)
        addSubview(catch5Fishes)
        addSubview(use3Types)
        addSubview(buyAnyUpgrade)
        addSubview(play10Times)
        addSubview(catch1Fich)
    }
    
    func setupConstraints() {
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
        achievementsLabelView.snp.makeConstraints { make in
            make.top.equalTo(homeButton.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(60)
        }
        catch5Fishes.snp.makeConstraints { make in
            make.top.equalTo(achievementsLabelView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(74)
        }
        
        use3Types.snp.makeConstraints { make in
            make.top.equalTo(catch5Fishes.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(74)
        }
        
        buyAnyUpgrade.snp.makeConstraints { make in
            make.top.equalTo(use3Types.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(74)
        }
        
        play10Times.snp.makeConstraints { make in
            make.top.equalTo(buyAnyUpgrade.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(74)
        }
        
        catch1Fich.snp.makeConstraints { make in
            make.top.equalTo(play10Times.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(74)
        }
        
    }
}
