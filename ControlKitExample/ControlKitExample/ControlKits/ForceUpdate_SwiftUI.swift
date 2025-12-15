//
//  ForceUpdate.swift
//  ControlKitExample
//
//  Created by Maziar Saadatfar on 10/1/25.
//
import SwiftUI
import ForceUpdateKit_SwiftUI
import ControlKitBase
struct ForceUpdate_SwiftUI: ControlKitProtocol {
    var title: String = "ForceUpdateKit"
    var icon: String = "ForceUpdateKit"
    var selectedIndex: Int = 0
    var styles: [String: Any] = [
        "fullscreen1" : ForceUpdateViewStyle.fullscreen1,
        "fullscreen2" : ForceUpdateViewStyle.fullscreen2,
        "fullscreen3": ForceUpdateViewStyle.fullscreen3,
        "fullscreen4" : ForceUpdateViewStyle.fullscreen4,
        "popover1" : ForceUpdateViewStyle.popover1,
        "popover2" : ForceUpdateViewStyle.popover2
    ]
    
    var serviceConfigs: [Any]?
    var viewConfigs: [Any]?
    var appId: String = PlatformId
    var name: String?
    var language: CKLanguage = CKLanguage(rawValue: getLanguage()) ?? .english

    func getView() async -> AnyView {
        let sortedKeys = styles.keys.sorted()
        guard selectedIndex < sortedKeys.count else {
            let serviceConfig = UpdateServiceConfig(
                style: .fullscreen1,
                appId: appId,
                language: CKLanguage(rawValue: getLanguage()) ?? .english
            )
            let view = await ForceUpdateKit().configure(config: serviceConfig)
            return AnyView(view)
        }
        let key = sortedKeys[selectedIndex]
        let style = styles[key] as? ForceUpdateViewStyle ?? .fullscreen1
        let serviceConfig = UpdateServiceConfig(
            style: style,
            appId: appId,
            language: CKLanguage(rawValue: getLanguage()) ?? .english
        )
        let view = await ForceUpdateKit().configure(config: serviceConfig)
        return AnyView(view)
    }
}
