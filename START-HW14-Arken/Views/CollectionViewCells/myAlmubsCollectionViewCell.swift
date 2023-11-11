//
//  myAlmubsCollectionViewCell.swift
//  START-HW14-Arken
//
//  Created by Arken Sarsenov on 11.11.2023.
//

import UIKit
import SnapKit

class myAlmubsCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "my-albums"
    private lazy var photoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    private lazy var photoCountLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        return stackView
    }()

    // MARK: - Content View Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupUI
    private func setupViews() {
        contentView.addSubview(photoImageView)
        contentView.addSubview(labelsStackView)
        labelsStackView.addArrangedSubview(titleLabel)
        labelsStackView.addArrangedSubview(photoCountLabel)
        
        
    }
    private func setupConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.leading.equalTo(contentView)
            make.trailing.equalTo(contentView)
            make.height.equalTo(150)
        }
        labelsStackView.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom)
        }
    }
    
    public func configureCell(photo: String, title: String, count: String) {
        photoImageView.image = UIImage(named: photo)
        titleLabel.text = title
        photoCountLabel.text = count
    }
}
