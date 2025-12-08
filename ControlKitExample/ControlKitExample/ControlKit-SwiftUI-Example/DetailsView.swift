//
//  DetailsView.swift
//  ControlKitExampleSwiftUI
//
//  Created by Maziar on 10/20/25.
//

import SwiftUI
import ForceUpdateKit
import LaunchAlertKit
import InboxKit
import NetPromoterScoreKit_SwiftUI
import AgreementKit_SwiftUI
import ContactSupportKit_SwiftUI
import VoteKit
import ControlKitBase

struct DetailsView: View {
    let item: ControlKitProtocol
    @State private var items: [String] = []
    @State private var selectedStyleName: String = ""
    @Environment(\.presentationMode) var presentationMode
    @State private var showingSheet = false
    @State private var sheetContent: AnyView = AnyView(Text(""))
    @State private var isLoading = false
    
    init(item: ControlKitProtocol) {
        self.item = item
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                // Title and icon
                VStack(spacing: 16) {
                    if let image = UIImage(named: item.icon) {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 80, height: 80)
                    }
                    Text(item.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .padding(.top, 20)
                .padding(.bottom, 30)
                
                // List of styles
                List {
                    ForEach(items, id: \.self) { styleName in
                        Button(action: {
                            Task {
                                await loadStyleView(styleName: styleName)
                            }
                        }) {
                            HStack {
                                if let image = UIImage(named: item.icon) {
                                    Image(uiImage: image.imageWithSize(size: CGSize(width: 30, height: 30)) ?? image)
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                }
                                Text(styleName)
                                    .foregroundColor(.primary)
                                Spacer()
                            }
                        }
                        .disabled(isLoading)
                    }
                }
                .listStyle(PlainListStyle())
                .fullScreenCover(isPresented: $showingSheet) {
                    sheetContent
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            items = item.styles.keys.sorted()
        }
    }
    
    private func loadStyleView(styleName: String) async {
        guard !isLoading else { return }
        
        isLoading = true
        selectedStyleName = styleName
        
        if let index = item.styles.firstIndex(where: { $0.key == styleName }) {
            let idx = item.styles.distance(from: item.styles.startIndex, to: index)
            
            // Create a mutable copy based on the item type
            var mutableItem: ControlKitProtocol
            
            // Create a new instance of the appropriate type
            switch item.title {
            case "ForceUpdateKit":
                var newItem = ForceUpdate()
                newItem.selectedIndex = idx
                mutableItem = newItem
            case "LaunchAlertKit":
                var newItem = LaunchAlert()
                newItem.selectedIndex = idx
                mutableItem = newItem
            case "InboxKit":
                var newItem = InboxViewKit()
                newItem.selectedIndex = idx
                mutableItem = newItem
            case "AgreementKit":
                var newItem = Agreement_SwiftUI()
                newItem.selectedIndex = idx
                mutableItem = newItem
            case "ContactSupportKit":
                var newItem = ContactSupport_SwiftUI()
                newItem.selectedIndex = idx
                mutableItem = newItem
            case "NetPromoterScoreKit":
                var newItem = NetPromoterScore_SwiftUI()
                newItem.selectedIndex = idx
                mutableItem = newItem
            case "VoteKit":
                var newItem = Vote_SwiftUI()
                newItem.selectedIndex = idx
                mutableItem = newItem
            default:
                sheetContent = AnyView(Text("Unknown item type"))
                isLoading = false
                showingSheet = true
                return
            }
            
            let view = await mutableItem.getView()
            sheetContent = view
            isLoading = false
            showingSheet = true
        } else {
            sheetContent = AnyView(Text("Style not found"))
            isLoading = false
            showingSheet = true
        }
    }
}

#Preview {
    DetailsView(item: Vote_SwiftUI())
}

