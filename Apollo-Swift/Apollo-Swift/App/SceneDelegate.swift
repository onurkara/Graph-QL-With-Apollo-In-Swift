//
//  SceneDelegate.swift
//
//  Created by Onur on 14.05.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }

        let window = UIWindow(windowScene: windowScene)
        let launchesViewController = LaunchesViewController()
        launchesViewController.viewModel = LaunchesViewModel(launchesRepository: LaunchesRepository())
        window.rootViewController = UINavigationController(rootViewController: launchesViewController)
        self.window = window
        window.makeKeyAndVisible()
    }
}
