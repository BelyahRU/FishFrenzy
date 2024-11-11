
import Foundation
import UIKit

class AlbumCell: UICollectionViewCell {
    
    static let reuseId = "AlbumCell"
    
    private let image = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
    }
    
    private func setupUI() {
        image.contentMode = .scaleAspectFit
        
        contentView.addSubview(image)
        
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    public func setupCell(fish: FishData) {
//        image.image = UIImage(named: fish.closedImageName)
        if fish.isOpened {
            image.image = UIImage(named: fish.albumImageName)
        } else {
            image.image = UIImage(named: fish.closedImageName)
        }
    }
}
