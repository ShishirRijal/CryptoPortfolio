//
//  CurrencyToggleSwitch.swift
//  CryptoPortfolio
//
//  Created by Shishir Rijal on 15/08/2025.
//


import SwiftUI

struct CurrencyToggleSwitch: View {
    @Binding var selectedCurrency: CurrencyType
    @State private var isCamera: Bool = true
    
    var body: some View {
        HStack(spacing: 0) {
            // Camera/INR Button
            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    isCamera = true
                    selectedCurrency = .inr
                }
            }) {
                Image(systemName: "banknote")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(isCamera ? .white : .white.opacity(0.8))
                    .frame(width: 50, height: 38)
            }
            
            // Bitcoin Button
            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    isCamera = false
                    selectedCurrency = .bitcoin
                }
            }) {
                Image(systemName: "bitcoinsign")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(!isCamera ? .white : .white.opacity(0.8))
                    .frame(width: 50, height: 38)
            }
        }
        
        .background(
            ZStack {
              
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.theme.gray)
                
                // Sliding indicator
                RoundedRectangle(cornerRadius: 18)
                    .fill(Color.dark)
                    .frame(width: 46, height: 34)
                    .offset(x: isCamera ? -25 : 25)
                    .animation(.easeInOut(duration: 0.3), value: isCamera)
            }
        )
        .frame(width: 100, height: 38)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .onAppear {
            isCamera = selectedCurrency == .inr
        }
    }
}
