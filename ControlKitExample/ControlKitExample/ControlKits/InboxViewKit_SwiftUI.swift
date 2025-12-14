//
//  InboxView.swift
//  ControlKitExample
//
//  Created by Maziar Saadatfar on 10/1/25.
//
import SwiftUI
import InboxKit_SwiftUI
import ControlKitBase
struct InboxViewKit_SwiftUI: ControlKitProtocol {
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
    
    func getView() async -> AnyView {
        let sortedKeys = styles.keys.sorted()
        guard selectedIndex < sortedKeys.count else {
            let serviceConfig = InboxServiceConfig(
                style: .darkMode,
                appId: appId,
                language: CKLanguage(rawValue: getLanguage()) ?? .english
            )
            let view = await InboxKit().configure(config: serviceConfig)
            return AnyView(view)
        }
        let key = sortedKeys[selectedIndex]
        let style = styles[key] as? InboxViewStyle ?? .darkMode
        let serviceConfig = InboxServiceConfig(
            style: style,
            appId: appId,
            language: CKLanguage(rawValue: getLanguage()) ?? .english
        )
        let view = await InboxKit().configure(config: serviceConfig)
        return AnyView(view)
    }
}
