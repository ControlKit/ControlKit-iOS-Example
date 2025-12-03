//
//  LaunchAlert.swift
//  ControlKitExample
//
//  Created by Maziar Saadatfar on 10/1/25.
//
import UIKit
import LaunchAlertKit
import ControlKitBase
struct LaunchAlert: ControlKitProtocol {
    var title: String = "LaunchAlertKit"
    var icon: String = "LaunchAlertKit"
    var selectedIndex: Int = 0
    var styles: [String: Any] = [
        "fullscreen1" : LaunchAlertViewStyle.fullscreen1,
        "popover1" : LaunchAlertViewStyle.popover1,
        "popover2" : LaunchAlertViewStyle.popover2,
        "popover3" : LaunchAlertViewStyle.popover3,
        "popover4" : LaunchAlertViewStyle.popover4,
        "popover5" : LaunchAlertViewStyle.popover5
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
            let serviceConfig = AlertServiceConfig(
                style: style as? LaunchAlertViewStyle ?? .fullscreen1,
                appId: appId,
                language: CKLanguage(rawValue: getLanguage()) ?? .english
            )
            await LaunchAlertKit().configure(root: vc, config: serviceConfig)
        }
    }
}
