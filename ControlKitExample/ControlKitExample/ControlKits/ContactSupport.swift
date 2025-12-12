//
//  ContactSupport.swift
//  ControlKitExample
//
//  Created by Maziar Saadatfar on 10/1/25.
//
import UIKit
import ContactSupportKit
import ControlKitBase
struct ContactSupport: ControlKitProtocol {
    var title: String = "ContactSupportKit"
    var icon: String = "ContactSupportKit"
    var selectedIndex: Int = 0
    var styles: [String: Any] = [
        "style1" : ContactSupportViewStyle.style1,
        "style2" : ContactSupportViewStyle.style2,
        "style3" : ContactSupportViewStyle.style3,
        "style4" : ContactSupportViewStyle.style4
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
                let serviceConfig = ContactSupportServiceConfig(
                    style: .style1,
                    appId: appId
                )
                await ContactSupportKit().configure(root: vc, config: serviceConfig)
                return
            }
            let key = sortedKeys[selectedIndex]
            let style = styles[key] as? ContactSupportViewStyle ?? .style1
            let serviceConfig = ContactSupportServiceConfig(
                style: style,
                appId: appId
            )
            await ContactSupportKit().configure(root: vc, config: serviceConfig)
        }
    }
}
