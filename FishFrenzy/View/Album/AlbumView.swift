
import Foundation
import UIKit

class AlbumView: UIView {
    
    private let back = UIImageView(image:
            UIImage(named: Resources.Back.mainBackground))
    public let coinView = CoinsView()
    
    public let homeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.homeButton), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    private let albumLabelImage: UIImageView = {
       let im = UIImageView()
        im.image = UIImage(named: Resources.Labels.albumLabel)
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    public let fishesCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 163, height: 188)
        layout.minimumLineSpacing = 24
        layout.minimumInteritemSpacing = 24
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
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
        addSubview(coinView)
        addSubview(homeButton)
        addSubview(albumLabelImage)
        addSubview(fishesCollectionView)
    }
    
    private func setupConstraints() {
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
        
        albumLabelImage.snp.makeConstraints { make in
            make.top.equalTo(homeButton.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(60)
        }
        
        fishesCollectionView.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(albumLabelImage.snp.bottom).offset(24)
        }
    }
}
