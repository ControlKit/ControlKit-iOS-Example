//
//  ControlKitExampleSwiftUIApp.swift
//  ControlKitExampleSwiftUI
//
//  Created by Maziar on 10/20/25.
//

import SwiftUI
import CoreData

@main
struct ControlKitExampleSwiftUIApp: App {
    let persistentContainer = NSPersistentContainer(name: "ControlKitExample")
    
    init() {
        // Initialize Core Data
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data failed to load: \(error.localizedDescription)")
            }
        }
        
        // Initialize UserDefaults
        UserDefaults.standard.set(PlatformId, forKey: "AppId")
        if UserDefaults.standard.string(forKey: "SelectedLanguageCode") == nil {
            UserDefaults.standard.set("en", forKey: "SelectedLanguageCode")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

func getLanguage() -> String {
    return UserDefaults.standard.string(forKey: "SelectedLanguageCode") ?? "en"
}

