
import Foundation
import UIKit

class PauseView: UIView {
    
    private let back = UIImageView(image: UIImage(named: "pauseBackview"))
    
    public let cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cancelButton"), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    public let backHomeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backHomeButton"), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    public let continueButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "continueButton"), for: .normal)
        button.backgroundColor = .clear
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
        
        back.snp.makeConstraints { make in
            make.width.equalTo(240)
            make.height.equalTo(318)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        addSubview(backHomeButton)
        backHomeButton.snp.makeConstraints { make in
            make.width.equalTo(208)
            make.height.equalTo(48)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
        }
        addSubview(continueButton)
        continueButton.snp.makeConstraints { make in
            make.size.equalTo(160)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(backHomeButton.snp.top).offset(-16)
        }
        addSubview(cancelButton)
        cancelButton.snp.makeConstraints { make in
            make.size.equalTo(52)
            make.trailing.equalToSuperview()
            make.bottom.equalTo(back.snp.top).offset(-16)
        }
    }
    
}
