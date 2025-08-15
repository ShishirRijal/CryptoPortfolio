//
//  HeaderView.swift
//  CryptoPortfolio
//
//  Created by Shishir Rijal on 15/08/2025.
//


import SwiftUI

struct HeaderView: View {
    @Binding var selectedCurrency: CurrencyType
    var amount: String;
    
    var body: some View {
        ZStack {
            
            Image("ExchangeHeader")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 280) // Increased height to cover safe area
                .clipped()
                .clipShape(
                    UnevenRoundedRectangle(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 24,
                        bottomTrailingRadius: 24,
                        topTrailingRadius: 0
                    )
                )
                .ignoresSafeArea(.all, edges: .top)
                .offset(y: -60)
                
            
            VStack(alignment: .leading ) {
                 AppHeader()
                    .offset(y: 35)
                
                Spacer()
                
                // Portfolio value section
                VStack(spacing: 16) {
//                   Spacer()
                    
                    HStack {
                        HStack(spacing: 8) {
                            Text("Portfolio Value")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.white)
                            
                            Image(systemName: "chevron.right")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        // Currency toggle switch
                        CurrencyToggleSwitch(selectedCurrency: $selectedCurrency)
                    }
                    .padding(.horizontal, 20)
                    
                    // Portfolio amount
                    VStack(spacing: 8) {
                        HStack {
                            Text(amount)
                                .font(.system(size: 36, weight: .medium))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.bottom, 80)
                    
                    
                }
            }
        }
        .frame(height: 210)
    }
}

