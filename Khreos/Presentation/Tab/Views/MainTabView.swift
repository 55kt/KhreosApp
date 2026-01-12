//
//  MainTabView.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 12/1/26.
//

import SwiftUI

struct MainTabView: View {
    // MARK: - Initializer
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView {
                MainView()
            }
            HStack {
                // Custom Tab Bar
            }
        }
    }
}

// MARK: - Preview
#Preview {
    MainTabView()
}
