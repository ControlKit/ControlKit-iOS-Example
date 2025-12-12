//
//  Vote.swift
//  ControlKitExample
//
//  Created by Maziar Saadatfar on 10/1/25.
//
import UIKit
import ControlKitBase
import VoteKit
struct Vote: ControlKitProtocol {
    var title: String = "VoteKit"
    var icon: String = "VoteKit"
    var selectedIndex: Int = 2
    var styles: [String: Any] = [
        "fullscreen1" : VoteViewStyle.fullscreen1,
        "popover1" : VoteViewStyle.popover1,
        "popover2" : VoteViewStyle.popover2,
        "popover3" : VoteViewStyle.popover3,
        "popover4" : VoteViewStyle.popover4
    ]
    var serviceConfigs: [Any]?
    var viewConfigs: [Any]?
    var appId: String = PlatformId
    var name: String? = "Feature Preference Survey"
    var language: CKLanguage = CKLanguage(rawValue: getLanguage()) ?? .english
    
    func check(root: UIViewController?) {
        Task {
            guard let vc = root else {
                return
            }
            // Use sorted keys to get the correct style in order
            let sortedKeys = styles.keys.sorted()
            guard selectedIndex < sortedKeys.count else {
                let serviceConfig = VoteServiceConfig(
                    style: .popover1,
                    appId: appId,
                    name: name ?? "",
                    language: CKLanguage(rawValue: getLanguage()) ?? .english
                )
                await VoteKit().configure(root: vc, config: serviceConfig)
                return
            }
            let key = sortedKeys[selectedIndex]
            let style = styles[key] as? VoteViewStyle ?? .popover1
            let serviceConfig = VoteServiceConfig(
                style: style,
                appId: appId,
                name: name ?? "",
                language: CKLanguage(rawValue: getLanguage()) ?? .english
            )
            await VoteKit().configure(root: vc, config: serviceConfig)
        }
    }
}
