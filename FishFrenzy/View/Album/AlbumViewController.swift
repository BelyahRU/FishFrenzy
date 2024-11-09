
import Foundation
import UIKit

class AlbumViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    
    let albumView = AlbumView()
    let viewModel = AlbumViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        setupUI()
        setupButtons()
        setupCollectionView()
    }
    
    private func setupUI() {
        view.addSubview(albumView)
        
        albumView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
