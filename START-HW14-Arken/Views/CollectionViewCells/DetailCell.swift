//
//  DetailCell.swift
//  START-HW14-Arken
//
//  Created by Arken Sarsenov on 12.11.2023.
//

import UIKit

class DetailCell: UICollectionViewCell {
    
    // MARK: - Properties
    private lazy var photoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    static let identifier = "details"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Views
    private func setupUI() {
        contentView.addSubview(photoImageView)
    }
    
    private func setupConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    public func configureCell(imageName: String) {
        photoImageView.image = UIImage(named: imageName)
    }
}
