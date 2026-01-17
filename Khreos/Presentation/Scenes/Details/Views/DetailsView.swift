//
//  DetailsView.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 13/1/26.
//

import SwiftUI

struct DetailsView: View {
    // MARK: - Properties
    @State private var isNotification: Bool = false
    @Binding var path: NavigationPath
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(2341.toCurrency())
                        .font(.system(size: 27, weight: .black))
                        .foregroundStyle(.white)
                    Text("Iphone Credit")
                        .font(.system(size: 16, weight: .black))
                        .foregroundStyle(.primaryLight)
                }
                .padding(.vertical, 30)
                
                VStack(alignment: .leading, spacing: 26) {
                    VStack(alignment: .leading, spacing: 17) {
                        HStack(spacing: 16) {
                            InfoTagView(text: 342.toCurrency())
                            InfoTagView(text: 219.toCurrency())
                        }
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pharetra, quam sed elementum imperdiet, diam magna consectetur nisl, euismod tempor ante elit ut dolor")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundStyle(.primaryLight)
                    }
                    VStack(alignment: .leading, spacing: 20) {
                        Divider()
                            .overlay(.primaryLight)
                        
                        HStack {
                            Text("Next payment")
                                .font(.system(size: 14, weight: .regular))
                                .foregroundStyle(.primaryLight)
                            
                            Spacer()
                            
                            HStack(spacing: 4) {
                                Text("Payed")
                                    .font(.system(size: 12, weight: .regular))
                                Text("12.12.2024")
                                    .font(.system(size: 12, weight: .black))
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 8)
                            .background(.primaryLight)
                            .clipShape(Capsule())
                        }
                        .padding(.horizontal, 10)
                        
                        Divider()
                            .overlay(.primaryLight)
                        
                        HStack {
                            Text("Payment notification")
                                .font(.system(size: 14, weight: .regular))
                                .foregroundStyle(.primaryLight)
                                .offset(y: -3)
                            
                            Spacer()
                            
                            RadioButton(isSelected: $isNotification)
                        }
                        .padding(.horizontal, 10)
                    }
                }
                VStack(alignment: .leading) {
                    Spacer()
                    AppButton(text: "Close early", textColor: .primaryDark, buttonBackground: .primaryLight)
                    AppButton(text: "Remove last payment", textColor: .primaryLight, buttonBackground: Color.clear, strokeColor: .primaryLight)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.top, 70)
            
            DetailsViewHeader(backButtonAction: {
                if !path.isEmpty {
                    path.removeLast()
                }
            })
                .padding(.horizontal)
                .zIndex(1)
        }
        .background(.primaryDark)
    }
}

// MARK: - Preview
#Preview {
    DetailsView(path: .constant(.init()))
}
