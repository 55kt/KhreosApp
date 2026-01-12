//
//  MainViewContentHeader.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 12/1/26.
//

import SwiftUI

struct MainViewContentHeader: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Debts")
                    .font(.system(size: 16, weight: .black))
                    .foregroundStyle(.primaryLight)
                
                Spacer()
                
                HStack(spacing: 16) {
                    Button {
                        //
                    } label: {
                        Text("Monthly")
                            .font(.system(size: 12, weight: .black))
                            .foregroundStyle(.white)
                    }
                    Button {
                        //
                    } label: {
                        Text("One-Time")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundStyle(.white)
                    }
                }
            }
            
            HStack(spacing: 4) {
                Text(399.44.toCurrency())
                    .font(.system(size: 14, weight: .black))
                Text("Every month")
                    .font(.system(size: 12, weight: .regular))
            }
            .foregroundStyle(.white)
        }
    }
}

// MARK: - Preview
#Preview {
    MainViewContentHeader()
}
