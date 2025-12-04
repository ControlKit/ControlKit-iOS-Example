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
        "lightMode" : AgreementViewStyle.lightMode,
        "darkMode" : AgreementViewStyle.darkMode
    ]
    var serviceConfigs: [Any]?
    var viewConfigs: [Any]?
    var appId: String = PlatformId
    var name: String? = "Privacy Policy"
    var language: CKLanguage = CKLanguage(rawValue: getLanguage()) ?? .english
    func getView() async -> AnyView {
        let index = styles.index(styles.startIndex, offsetBy: selectedIndex)
        let style = styles.values[index]
        let serviceConfig = AgreementServiceConfig(
            style: style as? AgreementViewStyle ?? .darkMode,
            name: name ?? "",
            appId: appId,
            language: CKLanguage(rawValue: getLanguage()) ?? .english
        )
        let view = await AgreementKit().configure(config: serviceConfig)
        return AnyView(view)
    }
}

