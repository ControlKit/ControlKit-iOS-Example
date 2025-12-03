//
//  SceneDelegate.swift
//  ForceUpdateKitExample
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import UIKit
import ForceUpdateKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: scene)
        let vc = RootViewController(nibName: RootViewController.nameOfClass, bundle: nil)
        let navigationController = UINavigationController(rootViewController: vc)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        checkForceUpdate()
//        checkLaunchAlert(root: navigationController)
       
    }
    
    func checkLaunchAlert(root: UIViewController) {
        Task {
//            await LaunchAlertKit().configure(root: root)
        }
    }

    func checkForceUpdate() {
        Task {
            await ForceUpdateKit().configure()
        }
    }
    
    func checkForceUpdateStyle2() {
        Task {
            let config = UpdateServiceConfig()
            config.viewConfig.style = .popover1
            config.viewConfig.contentViewBackColor = .black
            config.viewConfig.popupViewBackColor = .black
            config.viewConfig.headerTitleColor = .white
            config.viewConfig.updateImageType = .gear
            config.viewConfig.updateImageColor = .orange
            config.viewConfig.updateButtonBackColor = .orange
            config.viewConfig.versionTextColor = .orange
            await ForceUpdateKit().configure(config: config)
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}

