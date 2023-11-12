//
//  PeopleCell.swift
//  START-HW14-Arken
//
//  Created by Arken Sarsenov on 12.11.2023.
//

import UIKit
import SnapKit

final class PeopleCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "people"
    
    private lazy var firstPhotoView: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    private lazy var secondPhotoView: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    private lazy var thirdPhotoView: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    private lazy var foursPhotoView: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
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
    private lazy var firstStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        return stackView
    }()
    private lazy var secondStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        return stackView
    }()
    
    private lazy var labelsStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    let width: CGFloat = 72

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
        contentView.addSubview(firstStackView)
        firstStackView.addArrangedSubview(firstPhotoView)
        firstStackView.addArrangedSubview(secondPhotoView)
        
        contentView.addSubview(secondStackView)
        secondStackView.addArrangedSubview(thirdPhotoView)
        secondStackView.addArrangedSubview(foursPhotoView)
        
        contentView.addSubview(labelsStackView)
        labelsStackView.addArrangedSubview(titleLabel)
        labelsStackView.addArrangedSubview(photoCountLabel)
        
        
    }
    private func setupConstraints() {
        firstStackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(width)
        }
        secondStackView.snp.makeConstraints { make in
            make.top.equalTo(firstStackView.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(width)
        }
        labelsStackView.snp.makeConstraints { make in
            make.top.equalTo(secondStackView.snp.bottom)
        }
    }
    public func configureCell(photo: [String], title: String, count: String) {
        firstPhotoView.image = UIImage(named: photo[0])
        firstPhotoView.layer.cornerRadius = width/2
        secondPhotoView.image = UIImage(named: photo[1])
        secondPhotoView.layer.cornerRadius = width/2
        thirdPhotoView.image = UIImage(named: photo[2])
        thirdPhotoView.layer.cornerRadius = width/2
        foursPhotoView.image = UIImage(named: photo[3])
        foursPhotoView.layer.cornerRadius = width/2
        titleLabel.text = title
        photoCountLabel.text = count
    }
}
