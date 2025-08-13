//
//  TransactionSummaryCard.swift
//  CryptoPortfolio
//
//  Created by Shishir Rijal on 13/08/2025.
//

import SwiftUI

struct TransactionSummaryCard: View {
    @Binding var selectedCurrency: CurrencyType
    
    var body: some View {
        ZStack {
            // Bottom background card (darkest)
            RoundedRectangle(cornerRadius: 24)
                .fill(Color(red: 17/255, green: 23/255, blue: 104/255))
                .frame(width: 325, height: 177)
                .offset(x: -1, y: 18) // Positioned offset from main card
            
            // Middle background card
            RoundedRectangle(cornerRadius: 24)
                .fill(Color(red: 42/255, green: 31/255, blue: 127/255))
                .frame(width: 345, height: 177)
                .offset(x: -6, y: 9) // Positioned offset from main card
            
            // Main portfolio card (front)
            VStack(spacing: 16) {
                
                // Currency Badge
                HStack {
                    Spacer()
                    Text("INR")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.theme.blue.opacity(0.6))
                        )
                    Spacer()
                }
                
                // Portfolio Amount
                VStack(spacing: 8) {
                    Text("1,57,342.05")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white)
                    
                    HStack(spacing: 18) {
                        Text("₹ 1,342")
                            .foregroundColor(.white.opacity(0.64))
                        
                        Text("+4.6%")
                            .foregroundColor(.green)
                    }
                    .font(.system(size: 14, weight: .medium))
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 30)
            .background(
                Image("ExchangeHeader")
                    .resizable()
                    .frame(height: 177)
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 24))
            )
        }
        .padding(.horizontal, 20)
        }
}
