//
//  ContactSupport.swift
//  ControlKitExample
//
//  Created by Maziar Saadatfar on 10/1/25.
//
import UIKit
import ContactSupportKit_SwiftUI
import ControlKitBase
import SwiftUI
struct ContactSupport_SwiftUI: ControlKitProtocol {
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
    
    func getView() async -> AnyView {
        let index = styles.index(styles.startIndex, offsetBy: selectedIndex)
        let style = styles.values[index]
        let serviceConfig = ContactSupportServiceConfig(
            style: style as? ContactSupportViewStyle ?? .style1,
            appId: appId
        )
        return await AnyView(ContactSupportKit().configure(config: serviceConfig))
    }
}
