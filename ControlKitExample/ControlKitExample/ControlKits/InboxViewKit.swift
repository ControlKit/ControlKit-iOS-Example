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
        "lightMode" : InboxViewStyle.lightMode,
        "darkMode" : InboxViewStyle.darkMode
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
            let index = styles.index(styles.startIndex, offsetBy: selectedIndex)
            let style = styles.values[index]
            let serviceConfig = InboxServiceConfig(
                style: style as? InboxViewStyle ?? .darkMode,
                appId: appId,
                language: CKLanguage(rawValue: getLanguage()) ?? .english
            )
            await InboxKit().configure(root: vc, config: serviceConfig)
        }
    }
}
