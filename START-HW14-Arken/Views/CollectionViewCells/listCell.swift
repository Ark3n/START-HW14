//
//  listCell.swift
//  START-HW14-Arken
//
//  Created by Arken Sarsenov on 11.11.2023.
//
import UIKit
import SnapKit

final class ListCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "list"
    private lazy var photoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleToFill
        imageView.tintColor = .systemBlue
        return imageView
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = .systemBlue
        return label
    }()
    private lazy var photoCountLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var chevronImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .systemGray
        return imageView
    }()
    
    private lazy var seporatorView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemGray
        return view
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
        addSubview(photoImageView)
        addSubview(titleLabel)
        addSubview(photoCountLabel)
        addSubview(chevronImageView)
        addSubview(seporatorView)
    }
    private func setupConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.leading.equalTo(contentView)
            make.centerY.equalTo(contentView)
        }
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(photoImageView.snp.trailing).offset(10)
        }
        
        photoCountLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(chevronImageView.snp.leading).offset(-10)
        }
        chevronImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10)
        }
        
        seporatorView.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
            make.bottom.equalTo(contentView.snp.bottom)
            make.height.equalTo(1)
        }
    }
    
    public func configureCell(photo: String, title: String, count: String) {
        photoImageView.image = UIImage(systemName: photo)
        titleLabel.text = title
        photoCountLabel.text = count
    }
}

