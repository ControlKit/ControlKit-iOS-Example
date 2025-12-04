//
//  LanguagePickerView.swift
//  ControlKitExample
//
//  Created by Maziar Saadatfar on 12/4/25.
//
import SwiftUI
struct LanguagePickerView: View {
    let languages: [(flag: String, name: String, code: String)]
    @Binding var selectedCode: String
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(languages, id: \.code) { language in
                    Button(action: {
                        UserDefaults.standard.set(language.code, forKey: "SelectedLanguageCode")
                        UserDefaults.standard.synchronize()
                        selectedCode = language.code
                        isPresented = false
                    }) {
                        HStack {
                            Text(language.flag)
                            Text("\(language.name) (\(language.code))")
                            Spacer()
                            if selectedCode == language.code {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Select Language")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
            }
        }
    }
}
