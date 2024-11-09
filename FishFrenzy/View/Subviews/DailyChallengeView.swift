
import Foundation
import UIKit

class DailyChallengeView: UIView {
    
    private let back = UIImageView(image:
                        UIImage(named: Resources.Back.dailyChallengeBack))
    
    private let cup = UIImageView(image: UIImage(named: Resources.Views.cup))
    
    private let challengeProgressLabel: UILabel = {
       let label = UILabel()
        label.text = "2/5"
        label.font =  UIFont(name: "Cherry Bomb One", size: 14)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let dailyChallengeLabel: UILabel = {
        let label = UILabel()
         label.text = "Daily Challenge"
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(back)
        addSubview(progressView)
        addSubview(cup)
        addSubview(challengeProgressLabel)
        addSubview(dailyChallengeLabel)
        
        back.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        cup.snp.makeConstraints { make in
            make.size.equalTo(32)
            make.centerY.equalToSuperview().offset(-3)
            make.leading.equalToSuperview().offset(10)
        }
        
        challengeProgressLabel.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.bottom.equalToSuperview().offset(-17)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        progressView.snp.makeConstraints { make in
            make.trailing.equalTo(challengeProgressLabel.snp.leading).offset(-5)
            make.leading.equalTo(cup.snp.trailing).offset(8)
            make.height.equalTo(16)
            make.centerY.equalTo(challengeProgressLabel.snp.centerY).offset(2)
        }
        
        dailyChallengeLabel.snp.makeConstraints { make in
            make.bottom.equalTo(progressView.snp.top).offset(-3)
            make.leading.equalTo(progressView.snp.leading)
        }
    }
    
    public func reloadData() {
        
    }
}
