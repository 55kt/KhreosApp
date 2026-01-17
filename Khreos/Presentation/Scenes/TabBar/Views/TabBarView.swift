//
//  TabBarView.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 12/1/26.
//

import SwiftUI

struct TabBarView: View {
    // MARK: - Initializer
    init(path: Binding<NavigationPath>) {
        UITabBar.appearance().isHidden = true
        self._path = path
    }
    
    // MARK: - Properties
    @State private var selectionPage: TabPage = .main
    @Binding var path: NavigationPath
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectionPage) {
                MainView(path: $path)
                    .tag(TabPage.main)
                
                PaymentsView()
                    .tag(TabPage.paymentList)
                
                Text("Settings")
                    .tag(TabPage.settings)
            }
            HStack {
                TabItem(image: "house.fill", text: "Main", pageType: .main, selectedTab: $selectionPage)
                
                TabItem(image: "dollarsign.circle.fill", text: "Payments", pageType: .paymentList,selectedTab: $selectionPage)
                
                TabItem(image: "gear", text: "Settings", pageType: .settings, selectedTab: $selectionPage)
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color(.primaryLight))
                    .shadow(color: Color.black.opacity(0.1), radius: 10, y: -2)
            )
            .padding(.horizontal, 30)
            .padding(.bottom, -20)
        }
    }
}

// MARK: - Preview
#Preview {
    TabBarView(path: .constant(.init()))
}
