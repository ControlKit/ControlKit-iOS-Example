//
//  AgreementKit.swift
//  ControlKitExample
//
//  Created by Maziar Saadatfar on 10/1/25.
//
import UIKit
import AgreementKit_SwiftUI
import ControlKitBase
import SwiftUI
struct Agreement_SwiftUI: ControlKitProtocol {
    var title: String = "AgreementKit"
    var icon: String = "AgreementKit"
    var selectedIndex: Int = 0
    var styles: [String: Any] = [
        "darkMode" : AgreementViewStyle.darkMode,
        "lightMode" : AgreementViewStyle.lightMode
    ]
    var serviceConfigs: [Any]?
    var viewConfigs: [Any]?
    var appId: String = PlatformId
    var name: String? = "Privacy Policy"
    var language: CKLanguage = CKLanguage(rawValue: getLanguage()) ?? .english
    func getView() async -> AnyView {
        // Use sorted keys to get the correct style in order
        let sortedKeys = styles.keys.sorted()
        guard selectedIndex < sortedKeys.count else {
            let serviceConfig = AgreementServiceConfig(
                style: .darkMode,
                name: name ?? "",
                appId: appId,
                language: CKLanguage(rawValue: getLanguage()) ?? .english
            )
            let view = await AgreementKit().configure(config: serviceConfig)
            return AnyView(view)
        }
        let key = sortedKeys[selectedIndex]
        let style = styles[key] as? AgreementViewStyle ?? .darkMode
        let serviceConfig = AgreementServiceConfig(
            style: style,
            name: name ?? "",
            appId: appId,
            language: CKLanguage(rawValue: getLanguage()) ?? .english
        )
        let view = await AgreementKit().configure(config: serviceConfig)
        return AnyView(view)
    }
}

