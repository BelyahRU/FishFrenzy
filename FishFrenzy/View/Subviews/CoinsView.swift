
import Foundation
import UIKit

class CoinsView: UIView {
    
    private let back = UIImageView(image:
            UIImage(named: Resources.Back.coinsBack))
    private let coin = UIImageView(image: UIImage(named: Resources.Views.coin))
    
    private let coinsLabel: UILabel = {
       let label = UILabel()
        label.text = "99999"
        label.font =  UIFont(name: "Cherry Bomb One", size: 22)
        label.textColor = .white
        label.textAlignment = .center
        return label
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
        addSubview(coin)
        addSubview(coinsLabel)
        
        back.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        coin.snp.makeConstraints { make in
            make.size.equalTo(36)
            make.centerY.equalTo(back.snp.centerY).offset(-3)
            make.leading.equalTo(back.snp.leading).offset(10)
        }
        
        coinsLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-7)
            make.leading.equalTo(coin.snp.trailing).offset(7)
            make.centerY.equalTo(coin.snp.centerY).offset(-2)
        }
    }
    
    public func reloadData() {
        
    }
}
