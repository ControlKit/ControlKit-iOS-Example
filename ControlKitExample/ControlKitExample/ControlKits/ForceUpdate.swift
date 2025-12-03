//
//  ForceUpdate.swift
//  ControlKitExample
//
//  Created by Maziar Saadatfar on 10/1/25.
//
import UIKit
import ForceUpdateKit
import ControlKitBase
struct ForceUpdate: ControlKitProtocol {
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
    
    func check(root: UIViewController?) {
        Task {
            let index = styles.index(styles.startIndex, offsetBy: selectedIndex)
            let style = styles.values[index]
            let service = UpdateServiceConfig(
                style: style as? ForceUpdateViewStyle ?? .fullscreen1,
                appId: appId,
                language: CKLanguage(rawValue: getLanguage()) ?? .english
            )
            await ForceUpdateKit().configure(config: service)
        }
    }
}
