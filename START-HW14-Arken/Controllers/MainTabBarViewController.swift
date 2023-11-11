//
//  ViewController.swift
//  START-HW14-Arken
//
//  Created by Arken Sarsenov on 07.11.2023.
//

import UIKit

final class MainTabBarViewController: UITabBarController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    // MARK: - Setup Tabbar
    private func setupTabBar() {
        let libaryNavController = configureTabBarItem(viewController: LibaryViewController(),
                                         title: "Libary", image: "photo.on.rectangle")
        let forYouNavController = configureTabBarItem(viewController: ForYouViewController(),
                                                      title: "For You", image: "heart.text.square")
        let albumsNavController = configureTabBarItem(viewController: AlbumsViewController(),
                                                      title: "Albums", image: "rectangle.stack.fill")
        let searchNavController = configureTabBarItem(viewController: SearchViewController(),
                                                      title: "Search", image: "magnifyingglass")
        viewControllers = [albumsNavController, libaryNavController, forYouNavController, searchNavController]
    }
    
    private func configureTabBarItem(viewController: UIViewController, title: String, image: String) -> UINavigationController {
        let vc = viewController
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(systemName: image)
        return UINavigationController(rootViewController: vc)
    }
}

