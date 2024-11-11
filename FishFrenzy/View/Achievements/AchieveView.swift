
import Foundation
import UIKit

class AchieveView: UIView {
    
    private let back = UIImageView(image: UIImage(named: "achieveBack"))
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Catch 5 Fishes"
        label.font =  UIFont(name: "Cherry Bomb One", size: 20)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    let totalCount: UILabel = {
       let label = UILabel()
        label.text = "1/3"
        label.font =  UIFont(name: "Cherry Bomb One", size: 14)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    public var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressTintColor = UIColor(red: 0xFF / 255.0, green: 0x73 / 255.0, blue: 0x00 / 255.0, alpha: 1.0)
        progressView.layer.borderWidth = 2
        progressView.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        progressView.layer.cornerRadius = 8
        progressView.layer.masksToBounds = true
        progressView.trackTintColor = .clear
        progressView.backgroundColor = UIColor.white
        progressView.setProgress(0.4, animated: false)
        return progressView
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
         label.font =  UIFont(name: "Cherry Bomb One", size: 18)
         label.textColor = .white
         label.textAlignment = .left
         label.text = "50"
         return label
     }()
    
    private let coinImage: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: Resources.Views.coin)
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    public let claimedButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "claimedButton"), for: .normal)
        button.backgroundColor = .clear
        button.isHidden = true
        return button
    }()
    
    public let claimButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "claimButton"), for: .normal)
        button.backgroundColor = .clear
        button.isHidden = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(back)
        addSubview(titleLabel)
        addSubview(progressView)
        addSubview(totalCount)
        addSubview(priceLabel)
        addSubview(coinImage)
        addSubview(claimedButton)
        addSubview(claimButton)
        back.contentMode = .scaleAspectFill
        back.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(6)
            make.leading.equalToSuperview().offset(16)
        }
        
        progressView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.width.equalTo(230)
            make.height.equalTo(14)
            make.leading.equalToSuperview().offset(16)
        }
        
        totalCount.snp.makeConstraints { make in
            make.centerY.equalTo(progressView.snp.centerY)
            make.leading.equalTo(progressView.snp.trailing).offset(3)
        }
        
        coinImage.snp.makeConstraints { make in
            make.size.equalTo(24)
            make.centerY.equalToSuperview()
            make.leading.equalTo(totalCount.snp.trailing).offset(3)
        }
        priceLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(coinImage.snp.trailing).offset(1)
        }
        claimedButton.snp.makeConstraints { make in
            make.width.equalTo(95)
            make.height.equalTo(42)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
        }
        claimButton.snp.makeConstraints { make in
            make.width.equalTo(76)
            make.height.equalTo(42)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    public func setupUI(title: String, total: String, isClaimed: Bool) {
        titleLabel.text = title
        totalCount.text = total
        if let progress = convertTotalToFloat(total) {
            progressView.setProgress(progress, animated: false)
            if progress == 1 {
                progressView.snp.updateConstraints { make in
                    make.width.equalTo(140)
                }
                if isClaimed == true {
                    claimedButton.isHidden = false
                } else {
                    claimButton.isHidden = false
                }
            }
        }
    }
    
    private func convertTotalToFloat(_ total: String) -> Float? {
        let components = total.split(separator: "/")
        
        guard components.count == 2,
              let numerator = Float(components[0]),
              let denominator = Float(components[1]),
              denominator != 0 else {
            return nil // Возвращаем nil, если что-то пошло не так
        }
        
        return numerator / denominator
    }

}
