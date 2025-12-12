//
//  NetPromoterScore.swift
//  ControlKitExample
//
//  Created by Maziar Saadatfar on 10/1/25.
//
import SwiftUI
import NetPromoterScoreKit_SwiftUI
import ControlKitBase
struct NetPromoterScore_SwiftUI: ControlKitProtocol {
    var title: String = "NetPromoterScoreKit"
    var icon: String = "NetPromoterScoreKit"
    var selectedIndex: Int = 0
    var styles: [String: Any] = [
        "digit" : NetPromoterScoreViewStyle.digit,
        "star" : NetPromoterScoreViewStyle.star
    ]
    var serviceConfigs: [Any]?
    var viewConfigs: [Any]?
    var appId: String = PlatformId
    var name: String? = "Customer Satisfaction Survey"
    var language: CKLanguage = CKLanguage(rawValue: getLanguage()) ?? .english
    
    func getView() async -> AnyView {
        // Use sorted keys to get the correct style in order
        let sortedKeys = styles.keys.sorted()
        guard selectedIndex < sortedKeys.count else {
            let config = NetPromoterScoreViewConfig_Digit(lang: CKLanguage(rawValue: getLanguage()) ?? .english)
            let serviceConfig = NetPromoterScoreServiceConfig(
                name: name ?? "",
                appId: appId,
                language: CKLanguage(rawValue: getLanguage()) ?? .english,
                viewConfig: config,
            )
            return await AnyView(NetPromoterScoreKit().configure(config: serviceConfig))
        }
        let key = sortedKeys[selectedIndex]
        let style = styles[key] as! NetPromoterScoreViewStyle
        var config: NetPromoterScoreViewConfig = NetPromoterScoreViewConfig_Digit(lang: CKLanguage(rawValue: getLanguage()) ?? .english)
        if style != .digit {
            config = NetPromoterScoreViewConfig_Star(lang: CKLanguage(rawValue: getLanguage()) ?? .english)
        }
        
        //change the config ex: config.containerViewBackColor = UIColor(r: 115, g: 3, b: 0, a: 1.0)
        let serviceConfig = NetPromoterScoreServiceConfig(
            name: name ?? "",
            appId: appId,
            language: CKLanguage(rawValue: getLanguage()) ?? .english,
            viewConfig: config,
        )
        return await AnyView(NetPromoterScoreKit().configure(config: serviceConfig))
    }
}
