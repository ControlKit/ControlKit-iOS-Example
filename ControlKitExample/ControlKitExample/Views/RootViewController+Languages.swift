//
//  RootViewController+Languages.swift
//  ControlKitExample
//
//  Created by Maziar Saadatfar on 10/20/25.
//
import Foundation
import UIKit
extension RootViewController {
    func currentLanguageCode() -> String {
        return UserDefaults.standard.string(forKey: languageUserDefaultsKey) ?? "en"
    }

    func setupLanguageButton() {
        let code = currentLanguageCode().uppercased()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: code, style: .plain, target: self, action: #selector(languageButtonTapped))
    }

    private func updateLanguageButtonTitle() {
        navigationItem.rightBarButtonItem?.title = currentLanguageCode().uppercased()
    }

    @objc private func languageButtonTapped() {
        let alert = UIAlertController(title: "Select Language", message: nil, preferredStyle: .actionSheet)

        for item in languages {
            let title = "\(item.flag) \(item.name) (\(item.code))"
            let action = UIAlertAction(title: title, style: .default) { [weak self] _ in
                UserDefaults.standard.set(item.code, forKey: self?.languageUserDefaultsKey ?? "SelectedLanguageCode")
                UserDefaults.standard.synchronize()
                self?.updateLanguageButtonTitle()
            }
            alert.addAction(action)
        }

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))

        if let popover = alert.popoverPresentationController {
            popover.barButtonItem = navigationItem.rightBarButtonItem
        }
        present(alert, animated: true)
    }
}
