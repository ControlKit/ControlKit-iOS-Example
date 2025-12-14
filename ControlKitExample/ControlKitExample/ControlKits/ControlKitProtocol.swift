//
//  Untitled.swift
//  ControlKitExample
//
//  Created by Maziar Saadatfar on 10/1/25.
//
import UIKit
import ControlKitBase
import SwiftUI
//let PlatformId = "a083f315-ce4b-4670-b2ac-542abf14e8f3"
let PlatformId = "a02a9821-ac71-48cc-b9e4-b8cd971276b4"
var appId: String {
    return UserDefaults.standard.string(forKey: "AppId") ?? ""
}
protocol ControlKitProtocol {
    var title: String { get set }
    var icon: String { get set }
    var styles: [String: Any] { get set }
    var serviceConfigs: [Any]? { get set }
    var viewConfigs: [Any]? { get set }
    var appId: String { get set }
    var name: String? { get set }
    var selectedIndex: Int { get set }
    var language: CKLanguage { get set }
    func check(root: UIViewController?)
    func getView() async -> AnyView
}
extension ControlKitProtocol {
    func getView() async -> AnyView {
        return AnyView(Text(""))
    }
    func check(root: UIViewController?) {}
}
