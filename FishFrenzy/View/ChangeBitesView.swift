
import Foundation
import UIKit

final class ChangeBitesView: UIView {
    
    private let back = UIImageView(image: UIImage(named: "changeBitesView"))
    
    public let cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cancelButton"), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    public let shrimpView = BiteView(type: .shrimp, isGame: true)
    public let fishView = BiteView(type: .fish, isGame: true)
    public let breadView = BiteView(type: .bread, isGame: true)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setupSubviews()
        setupConstrains()
    }
    
    private func setupSubviews() {
        addSubview(back)
        addSubview(cancelButton)
        addSubview(breadView)
        addSubview(fishView)
        addSubview(shrimpView)
    }
    
    private func setupConstrains() {
        back.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(350)
            make.bottom.equalToSuperview()
        }
        
        cancelButton.snp.makeConstraints { make in
            make.size.equalTo(52)
            make.trailing.equalToSuperview()
            make.bottom.equalTo(back.snp.top).offset(-16)
        }
        
        breadView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
            make.width.equalTo(318)
            make.height.equalTo(84)
        }
        
        fishView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(breadView.snp.top).offset(-8)
            make.width.equalTo(318)
            make.height.equalTo(84)
        }
        
        shrimpView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(fishView.snp.top).offset(-8)
            make.width.equalTo(318)
            make.height.equalTo(84)
        }
    }
    
    
}
