//
//  DetailsViewController.swift
//  START-HW14-Arken
//
//  Created by Arken Sarsenov on 12.11.2023.
//

import UIKit

final class AlbumViewController: UIViewController {
    
    // MARK: - Properties
    var album: [String] = []
    lazy private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(DetailCell.self, forCellWithReuseIdentifier: DetailCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    // MARK: - SetupCollectionView
    private func setupUI() {
        view.addSubview(collectionView)
    }
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(view)
        }
    }
}

// MARK: - CollectionView Datasource
extension AlbumViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // album.photos.count
        album.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCell.identifier, for: indexPath) as? DetailCell else { return UICollectionViewCell()}
        cell.configureCell(imageName: album[indexPath.row])
        return cell
    }
}

// MARK: - CollectionView FlowLayout
extension AlbumViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        return CGSize(width: width * 0.3, height: width * 0.3)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
}

// MARK: - CollectionView FlowLayout
extension AlbumViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = album[indexPath.row]
        let vc = PhotoViewController()
        vc.configureImageView(imageName: photo)
        navigationController?.pushViewController(vc, animated: true)
    }
}
