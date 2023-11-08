//
//  SceneDelegate.swift
//  START-HW14-Arken
//
//  Created by Arken Sarsenov on 07.11.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.rootViewController = MainTabBarViewController()
        window?.makeKeyAndVisible()
    }
}

