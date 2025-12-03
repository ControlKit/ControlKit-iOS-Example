//
//  RootViewController+ChangeAPPID.swift
//  ControlKitExample
//
//  Created by Maziar Saadatfar on 10/20/25.
//
import Foundation
import UIKit
extension RootViewController {
    func showChangeIdPopup() {
        let alert = UIAlertController(title: "Change Plateform ID", message: "Enter new Plateform ID:", preferredStyle: .alert)
        
        // Add text field
        alert.addTextField { textField in
            textField.placeholder = "Plateform ID"
            textField.text = self.getCurrentAppId()
            textField.keyboardType = .default
        }
        
        // Save action
        let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self] _ in
            guard let textField = alert.textFields?.first,
                  let newId = textField.text,
                  !newId.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
                self?.showErrorAlert(message: "Please enter a valid ID")
                return
            }
            self?.saveAppId(newId)
        }
        
        // Cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    private func saveAppId(_ id: String) {
        UserDefaults.standard.set(id, forKey: "AppId")
        UserDefaults.standard.synchronize()
        
        // Show success message
        let successAlert = UIAlertController(title: "Success", message: "Plateform ID saved successfully", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "OK", style: .default))
        present(successAlert, animated: true)
    }
    
    private func getCurrentAppId() -> String {
        return UserDefaults.standard.string(forKey: "AppId") ?? ""
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
