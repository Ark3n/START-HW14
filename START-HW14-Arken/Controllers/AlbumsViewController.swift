//
//  AlbumsViewController.swift
//  START-HW14-Arken
//
//  Created by Arken Sarsenov on 08.11.2023.
//

import UIKit

class AlbumsViewController: UIViewController {
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        title = "Albums"
        view.backgroundColor = .systemBackground
    }
    private func setupConstraints() {
        
    }
}

