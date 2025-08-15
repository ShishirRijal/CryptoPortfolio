//
//  ExchangeView.swift
//  CryptoPortfolio
//
//  Created by Shishir Rijal on 13/08/2025.
//

import SwiftUI

struct ExchangeView: View {
    @State private var selectedCurrency: CurrencyType = .inr
    
    var body: some View {
        ZStack {
            // Background
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                // Header
                AppHeader()
                    .padding(.bottom, 20)
                
                
                // Portfolio Header Section
                TransactionSummaryCard(selectedCurrency: $selectedCurrency)
                    .padding(.bottom, 30)
                // Action Buttons
                ActionButtonsView()
                    .padding(.horizontal, 20)
                    
                
                // Transactions Section
                TransactionsSectionView()
                    .padding(.horizontal, 20)
                    .padding(.top, 24)
                     
            }
        }
    }
}



// MARK: - Action Buttons View
private struct ActionButtonsView: View {
    var body: some View {
        HStack(spacing: 16) {
            ActionButton(icon: "arrow.up", action: {})
            ActionButton(icon: "plus", action: {})
            ActionButton(icon: "arrow.down", action: {})
        }
        .frame(height: 52)
    }
}


#Preview {
    ExchangeView()
        .preferredColorScheme(.dark)
}

