//
//  PhotoViewController.swift
//  START-HW14-Arken
//
//  Created by Arken Sarsenov on 12.11.2023.
//

import UIKit
import SnapKit

final class PhotoViewController: UIViewController {
    // MARK: - Properties
    private lazy var PhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    // MARK: - Configure UI
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(PhotoImageView)
    }
    private func setupConstraints() {
        PhotoImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    public func configureImageView(imageName: String) {
        PhotoImageView.image = UIImage(named: imageName)
    }
}
