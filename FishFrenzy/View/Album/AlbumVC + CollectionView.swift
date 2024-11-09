
import Foundation
import UIKit

extension AlbumViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func setupCollectionView() {
        albumView.fishesCollectionView.delegate = self
        albumView.fishesCollectionView.dataSource = self
        albumView.fishesCollectionView.register(AlbumCell.self, forCellWithReuseIdentifier: AlbumCell.reuseId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.reuseId, for: indexPath) as? AlbumCell else { return UICollectionViewCell()}
        print(indexPath.row)
        guard let fishModel = viewModel.getFish(by: indexPath.row) else { return UICollectionViewCell() }
        print(fishModel.albumImageName)
        cell.setupCell(fish: fishModel)
        return cell
    }
}
