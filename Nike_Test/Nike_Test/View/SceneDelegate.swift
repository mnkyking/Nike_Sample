//
//  SceneDelegate.swift
//  Nike_Test
//
//  Created by Robin G on 5/19/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        //window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        let navigationController = UINavigationController()
        let albumListViewController = AlbumListViewController()
        navigationController.viewControllers = [albumListViewController]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
    }
}

