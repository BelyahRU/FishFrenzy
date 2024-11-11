

import Foundation
import UIKit

class TargetView: UIView {
    
    private let targetImage = UIImageView(image: UIImage(named: "targetImage"))
    
    private let targetLabel: UILabel = {
       let label = UILabel()
        label.text = "5m"
        label.font =  UIFont(name: "Cherry Bomb One", size: 24)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(targetImage)
        targetImage.contentMode = .scaleAspectFit
        targetImage.snp.makeConstraints { make in
            make.size.equalTo(33)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        addSubview(targetLabel)
        targetLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(targetImage.snp.bottom)
        }
    }
    
    public func changeTitle(num: Int) {
        targetLabel.text = "\(num)m"
    }
}
