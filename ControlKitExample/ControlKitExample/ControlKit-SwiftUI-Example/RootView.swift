//
//  RootView.swift
//  ControlKitExampleSwiftUI
//
//  Created by Maziar on 10/20/25.
//

import SwiftUI
import ControlKitBase

struct RootView: View {
    @State private var selectedLanguageCode: String = UserDefaults.standard.string(forKey: "SelectedLanguageCode") ?? "en"
    @State private var showLanguagePicker = false
    @State private var showChangeIdAlert = false
    @State private var newAppId: String = UserDefaults.standard.string(forKey: "AppId") ?? PlatformId
    
    let controlKitItems: [ControlKitProtocol] = [
        ForceUpdate(),
        LaunchAlert(),
        InboxViewKit(),
        Agreement_SwiftUI(),
        ContactSupport(),
        NetPromoterScore(),
        Vote()
    ]
    
    let languages: [(flag: String, name: String, code: String)] = [
        ("🇬🇧", "English", "en"),
        ("🇫🇷", "French", "fr"),
        ("🇮🇹", "Italian", "it"),
        ("🇪🇸", "Spanish", "es"),
        ("🇷🇺", "Russian", "ru"),
        ("🇩🇪", "German", "de"),
        ("🇸🇦", "Arabic", "ar"),
        ("🇮🇷", "Persian", "fa")
    ]
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(Array(controlKitItems.enumerated()), id: \.offset) { index, item in
                    NavigationLink(destination: DetailsView(item: item)) {
                        HStack {
                            if let image = UIImage(named: item.icon) {
                                Image(uiImage: image.imageWithSize(size: CGSize(width: 30, height: 30)) ?? image)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }
                            Text(item.title)
                                .font(.body)
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("ControlKit")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showLanguagePicker = true
                    }) {
                        Text(selectedLanguageCode.uppercased())
                            .font(.headline)
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        showChangeIdAlert = true
                    }) {
                        Image(systemName: "gearshape")
                    }
                }
            }
            .sheet(isPresented: $showLanguagePicker) {
                LanguagePickerView(
                    languages: languages,
                    selectedCode: $selectedLanguageCode,
                    isPresented: $showLanguagePicker
                )
            }
            .alert("Change Platform ID", isPresented: $showChangeIdAlert) {
                TextField("Platform ID", text: $newAppId)
                Button("Save") {
                    if !newAppId.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        UserDefaults.standard.set(newAppId, forKey: "AppId")
                        UserDefaults.standard.synchronize()
                    }
                }
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("Enter new Platform ID:")
            }
            .safeAreaInset(edge: .bottom) {
                HStack {
                    Spacer()
                    Button(action: {
                        clearAllData()
                    }) {
                        Text("Clear All Data")
                            .foregroundColor(.gray)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }
                    Spacer()
                }
                .padding(.vertical, 8)
                .background(Color(.systemBackground))
            }
        }
    }
    
    private func clearAllData() {
        UserDefaults.standard.removeObject(forKey: "latestLaunchAlertResponseId")
        UserDefaults.standard.removeObject(forKey: "CK_Vote_Name_\(Vote().name ?? "")")
        UserDefaults.standard.removeObject(forKey: "CK_NPS_Name_\(NetPromoterScore().name ?? "")")
    }
}

#Preview {
    RootView()
}
