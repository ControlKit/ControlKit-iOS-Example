//
//  LaunchAlert.swift
//  ControlKitExample
//
//  Created by Maziar Saadatfar on 10/1/25.
//
import SwiftUI
import LaunchAlertKit_SwiftUI
import ControlKitBase
struct LaunchAlert_SwiftUI: ControlKitProtocol {
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
    
    func getView() async -> AnyView {
        let sortedKeys = styles.keys.sorted()
        guard selectedIndex < sortedKeys.count else {
            let serviceConfig = AlertServiceConfig(
                style: .fullscreen1,
                appId: appId,
                language: CKLanguage(rawValue: getLanguage()) ?? .english
            )
            let view = await LaunchAlertKit().configure(config: serviceConfig)
            return AnyView(view)
        }
        let key = sortedKeys[selectedIndex]
        let style = styles[key] as? LaunchAlertViewStyle ?? .fullscreen1
        let serviceConfig = AlertServiceConfig(
            style: style,
            appId: appId,
            language: CKLanguage(rawValue: getLanguage()) ?? .english
        )
        let view = await LaunchAlertKit().configure(config: serviceConfig)
        return AnyView(view)
    }
}
