//
//  AlbumsViewController.swift
//  START-HW14-Arken
//
//  Created by Arken Sarsenov on 08.11.2023.
//

import UIKit
import SnapKit

final class AlbumsViewController: UIViewController {
    
    // MARK: - Properties
    var albums = AlbumsGroup.allGroups()
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(GirdCell.self, forCellWithReuseIdentifier: GirdCell.identifier)
        collectionView.register(ListCell.self, forCellWithReuseIdentifier: ListCell.identifier)
        collectionView.register(PeopleCell.self, forCellWithReuseIdentifier: PeopleCell.identifier)
        collectionView.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    // MARK: - Setup View
    private func setupViews() {
        title = "Albums"
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
    }
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    // MARK: - Create Compositional Layout
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            switch sectionIndex {
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalWidth(1))
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
                
                let layouSection = NSCollectionLayoutSection(group: layoutGroup)
                layouSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 0)
                layouSection.orthogonalScrollingBehavior = .groupPaging
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40))
                let headerLayout = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                layouSection.boundarySupplementaryItems = [headerLayout]
                
                return layouSection
                
            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalWidth(0.5))
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 1)
                
                let layouSection = NSCollectionLayoutSection(group: layoutGroup)
                layouSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 0)
                layouSection.orthogonalScrollingBehavior = .groupPaging
    
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40))
                let headerLayout = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                layouSection.boundarySupplementaryItems = [headerLayout]
                
                return layouSection
                
            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 10)
                
                let layouSection = NSCollectionLayoutSection(group: layoutGroup)
                layouSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
                layouSection.orthogonalScrollingBehavior = .groupPaging
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40))
                let headerLayout = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                layouSection.boundarySupplementaryItems = [headerLayout]
                
                return layouSection
            }
        }
    }
}
// MARK: - CollectionView DataSource
extension AlbumsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        albums[section].albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let album = albums[indexPath.section].albums[indexPath.row]
        switch indexPath.section {
        case 0, 1:
            if indexPath == [1, 0] {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PeopleCell.identifier, for: indexPath) as? PeopleCell else { return UICollectionViewCell()}
                cell.configureCell(photo: album.photos, title: album.title, count: album.count)
                return cell
            }
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GirdCell.identifier, for: indexPath) as? GirdCell else { return UICollectionViewCell()}
            cell.configureCell(photo: album.image, title: album.title, count: album.count)
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCell.identifier, for: indexPath) as? ListCell else { return UICollectionViewCell()}
            cell.configureCell(photo: album.image, title: album.title, count: album.count)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let title = albums[indexPath.section].title
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.identifier, for: indexPath) as! HeaderCell
        header.configureHeader(title: title)
        return header
    }
}

// MARK: - CollectionView DataSource
extension AlbumsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photos = albums[indexPath.section].albums[indexPath.row].photos
        let title = albums[indexPath.section].albums[indexPath.row].title
        collectionView.deselectItem(at: indexPath, animated: true)
        let detailVC = AlbumViewController()
        detailVC.title = title
        detailVC.album = photos
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
