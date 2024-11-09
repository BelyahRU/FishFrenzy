import UIKit
import Foundation
import SnapKit

class LoadingView: UIView {
    
    private let back = UIImageView(image:
            UIImage(named: Resources.Back.mainBackground))
    
    private let logoImage: UIImageView = {
       let im = UIImageView()
        im.image = UIImage(named: Resources.Views.logo)
        im.contentMode = .scaleAspectFit
        return im
    }()
    public var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressTintColor = UIColor(red: 0xFF / 255.0, green: 0x73 / 255.0, blue: 0x00 / 255.0, alpha: 1.0)
        progressView.layer.borderWidth = 2
        progressView.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        progressView.layer.cornerRadius = 10
        progressView.layer.masksToBounds = true
        progressView.trackTintColor = .clear
        progressView.backgroundColor = UIColor.white
        progressView.setProgress(0.0, animated: false)
        return progressView
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.font =  UIFont(name: "Cherry Bomb One", size: 24)
        label.textColor = .white
        return label
    }()
    
    private var timer: Timer?
    private var timerCounter: Float = 3
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLoading()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(back)
        addSubview(textLabel)
        addSubview(logoImage)
        addSubview(progressView)
        
        back.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(316)
            make.height.equalTo(182)
            make.center.equalToSuperview()
        }
        
        progressView.snp.makeConstraints { make in
            make.width.equalTo(240)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-40)
        }
        
        textLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-75)
        }
        
    }
    
    public func setupLoading() {
        timerCounter = 3
        progressView.layoutIfNeeded()
        progressView.setProgress(0, animated: false)
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            self.timerCounter += 0.2
            if self.timerCounter >= 3{
                timer.invalidate()
            }
            let progress = self.timerCounter
            self.progressView.setProgress(progress, animated: true)
        }
    }
}
