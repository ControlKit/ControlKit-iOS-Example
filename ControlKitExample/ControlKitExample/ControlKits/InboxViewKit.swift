//
//  InboxView.swift
//  ControlKitExample
//
//  Created by Maziar Saadatfar on 10/1/25.
//
import UIKit
import InboxKit
import ControlKitBase
struct InboxViewKit: ControlKitProtocol {
    var title: String = "InboxKit"
    var icon: String = "InboxKit"
    var selectedIndex: Int = 0
    var styles: [String: Any] = [
        "darkMode" : InboxViewStyle.darkMode,
        "lightMode" : InboxViewStyle.lightMode
    ]
    var serviceConfigs: [Any]?
    var viewConfigs: [Any]?
    var appId: String = PlatformId
    var name: String?
    var language: CKLanguage = CKLanguage(rawValue: getLanguage()) ?? .english
    
    func check(root: UIViewController?) {
        Task {
            guard let vc = root else {
                return
            }
            // Use sorted keys to get the correct style in order
            let sortedKeys = styles.keys.sorted()
            guard selectedIndex < sortedKeys.count else {
                let serviceConfig = InboxServiceConfig(
                    style: .darkMode,
                    appId: appId,
                    language: CKLanguage(rawValue: getLanguage()) ?? .english
                )
                await InboxKit().configure(root: vc, config: serviceConfig)
                return
            }
            let key = sortedKeys[selectedIndex]
            let style = styles[key] as? InboxViewStyle ?? .darkMode
            let serviceConfig = InboxServiceConfig(
                style: style,
                appId: appId,
                language: CKLanguage(rawValue: getLanguage()) ?? .english
            )
            await InboxKit().configure(root: vc, config: serviceConfig)
        }
    }
}
