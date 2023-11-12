//
//  HeaderCell.swift
//  START-HW14-Arken
//
//  Created by Arken Sarsenov on 11.11.2023.
//

import UIKit
import SnapKit

final class HeaderCell: UICollectionReusableView {
    
    // MARK: - Properties
    static let identifier = "header"
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 22)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .right
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    // MARK: - ContentView Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(separatorView)
        addSubview(titleLabel)
    }
    private func setupConstraints() {
        separatorView.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.leading.trailing.equalTo(self)
            make.height.equalTo(1)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(10)
            make.leading.equalTo(self)
        }
    }
    
    public func configureHeader(title: String) {
        titleLabel.text = title
    }
}
