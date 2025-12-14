//
//  AgreementKit.swift
//  ControlKitExample
//
//  Created by Maziar Saadatfar on 10/1/25.
//
import UIKit
import AgreementKit
import ControlKitBase
struct Agreement: ControlKitProtocol {
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
    
    func check(root: UIViewController?) {
        Task {
            guard let vc = root else {
                return
            }
            let index = styles.index(styles.startIndex, offsetBy: selectedIndex)
            let style = styles.values[index]
            let serviceConfig = AgreementServiceConfig(
                style: style as? AgreementViewStyle ?? .darkMode,
                name: name ?? "",
                appId: appId,
                language: CKLanguage(rawValue: getLanguage()) ?? .english
            )
            await AgreementKit().configure(root: vc, config: serviceConfig)
        }
    }
}

