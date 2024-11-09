
import Foundation
import UIKit

class MainView: UIView {
    
    private let back = UIImageView(image:
            UIImage(named: Resources.Back.mainBackground))
    
    private let logoImage: UIImageView = {
       let im = UIImageView()
        im.image = UIImage(named: Resources.Views.logo)
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    public let albumButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.albumButton), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    public let goToFishingButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.goToFishingButton), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    public let shopButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.shopButton), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    public let coinView = CoinsView()
    public let dailyChallengeView = DailyChallengeView()
    
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
        addSubview(logoImage)
        addSubview(albumButton)
        addSubview(goToFishingButton)
        addSubview(shopButton)
        addSubview(coinView)
        addSubview(dailyChallengeView)
    }
    
    private func setupConstraints() {
        
        back.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(316)
            make.height.equalTo(182)
            make.center.equalToSuperview()
        }
        
        goToFishingButton.snp.makeConstraints { make in
            make.size.equalTo(160)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-40)
        }
        
        albumButton.snp.makeConstraints { make in
            make.size.equalTo(72)
            make.trailing.equalTo(goToFishingButton.snp.leading).offset(-23)
            make.bottom.equalToSuperview().offset(-40)
        }
        
        shopButton.snp.makeConstraints { make in
            make.size.equalTo(72)
            make.leading.equalTo(goToFishingButton.snp.trailing).offset(23)
            make.bottom.equalToSuperview().offset(-40)
        }
        
        coinView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(60)
            make.width.equalTo(150)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(25)
        }
        
        dailyChallengeView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(25)
            make.height.equalTo(60)
        }
    }
}
