# ControlKit iOS Example

This repository demonstrates the usage of ControlKit components for iOS applications. The project contains **two separate targets**, each showcasing how to integrate ControlKit using different UI frameworks.

## 🎯 Project Structure

This project is organized into **two main targets**:

### 1. **ControlKitExample** (UIKit Target)
A UIKit-based iOS application demonstrating ControlKit integration using traditional UIKit patterns.

**Key Components:**
- `AppDelegate.swift` - Application entry point
- `SceneDelegate.swift` - Scene lifecycle management
- `RootViewController.swift` - Main view controller with table view
- `DetailsViewController.swift` - Detail view controller for kit demonstrations
- Uses XIB files for UI layout

**Location:** `ControlKitExample/Views/`

### 2. **ControlKitExampleSwiftUI** (SwiftUI Target)
A SwiftUI-based iOS application demonstrating the same ControlKit components using modern SwiftUI patterns.

**Key Components:**
- `ControlKitExampleSwiftUIApp.swift` - SwiftUI App entry point
- `RootView.swift` - Main SwiftUI view with navigation
- `DetailsView.swift` - Detail SwiftUI view for kit demonstrations
- `LanguagePickerView.swift` - Language selection view
- Pure SwiftUI declarative UI

**Location:** `ControlKitExample/ControlKit-SwiftUI-Example/`

## 📦 Shared ControlKits

Both targets share the same ControlKit implementations located in `ControlKitExample/ControlKits/`:

- **ForceUpdateKit** - Force update functionality
- **LaunchAlertKit** - Launch alert dialogs
- **InboxKit** - Inbox management
- **AgreementKit** - User agreement handling (with both UIKit and SwiftUI variants)
- **ContactSupportKit** - Contact support features
- **NetPromoterScoreKit** - NPS surveys
- **VoteKit** - Voting functionality (with both UIKit and SwiftUI variants)

## 🚀 Getting Started

### Prerequisites
- Xcode 15.0 or later
- iOS 17.0 or later
- Swift 5.9 or later

### Running the Project

1. Clone the repository:
```bash
git clone <repository-url>
cd ControlKitExample
```

2. Open the project in Xcode:
```bash
open ControlKitExample.xcodeproj
```

3. Select your target:
   - **For UIKit**: Select `ControlKitExample` scheme
   - **For SwiftUI**: Select `ControlKitExampleSwiftUI` scheme

4. Build and run the project (⌘R)

## 🎨 Features

Both targets demonstrate the same ControlKit features:

- **Multi-language Support**: English, French, Italian, Spanish, Russian, German, Arabic, and Persian
- **Platform ID Configuration**: Change platform ID through settings
- **Data Management**: Clear all stored data functionality
- **Kit Demonstrations**: Interactive examples of all available ControlKits

## 📱 Target Comparison

| Feature | UIKit Target | SwiftUI Target |
|---------|-------------|----------------|
| UI Framework | UIKit | SwiftUI |
| Entry Point | AppDelegate + SceneDelegate | @main App struct |
| Navigation | UINavigationController | NavigationStack |
| View Controllers | UIViewController + XIB | SwiftUI Views |
| Code Style | Imperative | Declarative |

## 🔧 Configuration

Both targets support:
- Language selection via UserDefaults key: `SelectedLanguageCode`
- Platform ID configuration via UserDefaults key: `AppId`
- Core Data integration for persistent storage

## 📝 Notes

- The UIKit target uses traditional UIKit patterns with storyboards/XIB files
- The SwiftUI target uses modern SwiftUI declarative syntax
- Both targets share the same ControlKit protocol implementations
- Some kits have separate UIKit and SwiftUI implementations (e.g., `AgreementKit.swift` vs `AgreementKit_SwiftUI.swift`, `Vote.swift` vs `Vote_SwiftUI.swift`)

## 📄 License

[Add your license information here]

## 👥 Contributors

[Add contributor information here]






