//
//  TabItem.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 13/1/26.
//

import SwiftUI

struct TabItem: View {
    // MARK: - Properties
    var image: String
    var text: String
    var pageType: TabPage
    @Binding var selectedTab: TabPage
    
    private var isSelected: Bool {
        pageType == selectedTab
    }
    
    // MARK: - Body
    var body: some View {
        Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                selectedTab = pageType
            }
        } label: {
            VStack(spacing: 6) {
                Image(systemName: image)
                    .font(.system(size: 24, weight: .semibold))
                    .scaleEffect(isSelected ? 1.1 : 1.0)
                
                Text(text)
                    .font(.system(size: 12, weight: .medium))
            }
            .foregroundStyle(isSelected ? Color(.primaryDark) : Color(.primaryDark).opacity(0.4))
            .frame(maxWidth: .infinity)
        }
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isSelected)
    }
}

// MARK: - Preview
#Preview {
    TabItem(image: "house", text: "Main", pageType: .main, selectedTab: .constant(.main))
        .padding()
        .background(.primaryLight)
}
