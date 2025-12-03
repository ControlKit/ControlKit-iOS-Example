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
            let index = styles.index(styles.startIndex, offsetBy: selectedIndex)
            let style = styles.values[index]
            let serviceConfig = ContactSupportServiceConfig(
                style: style as? ContactSupportViewStyle ?? .style1,
                appId: appId
            )
            await ContactSupportKit().configure(root: vc, config: serviceConfig)
        }
    }
}
