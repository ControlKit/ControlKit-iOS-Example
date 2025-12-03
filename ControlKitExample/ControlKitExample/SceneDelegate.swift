//
//  SceneDelegate.swift
//  ControlKitExample
//
//  Created by Maziar on 10/12/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: scene)
        UserDefaults.standard.set(PlatformId, forKey: "AppId")
        if UserDefaults.standard.string(forKey: "SelectedLanguageCode") == nil {
            UserDefaults.standard.set("en", forKey: "SelectedLanguageCode")
        }
        let vc = RootViewController(nibName: RootViewController.nameOfClass, bundle: nil)
        let navigationController = UINavigationController(rootViewController: vc)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
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

func getLanguage() -> String {
    return UserDefaults.standard.string(forKey: "SelectedLanguageCode") ?? "en"
}
