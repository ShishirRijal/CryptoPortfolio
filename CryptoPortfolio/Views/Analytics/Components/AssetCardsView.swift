//
//  AssetCardsView.swift
//  CryptoPortfolio
//
//  Created by Shishir Rijal on 15/08/2025.
//

import SwiftUI

 struct AssetCardsView: View {
    var body: some View {
        ScrollView(.horizontal){
            HStack(spacing: 15) {
                AssetCard(
                    icon: "Bitcoin",
                    iconColor: .orange,
                    name: "Bitcoin",
                    symbol: "BTC",
                    price: "₹75,62,502.14",
                    change: "+3.2%",
                    isPositive: true
                )
                
                AssetCard(
                    icon: "Ethereum",
                    iconColor: .gray,
                    name: "Ether",
                    symbol: "ETH",
                    price: "₹1,79,102.50",
                    change: "+5.7%",
                    isPositive: true
                )
            }
        }
    }
}


// MARK: - Asset Card
struct AssetCard: View {
    let icon: String
    let iconColor: Color
    let name: String
    let symbol: String
    let price: String
    let change: String
    let isPositive: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Image(icon)
                    .font(.system(size: 42))
                    .foregroundColor(iconColor)
                
           Spacer()
                
                Text("\(name) (\(symbol))")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                
            }
            .padding(.bottom, 24)
            
            
            
            HStack {
                Text(price)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                
                Spacer()
                
                Text(change)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(isPositive ? .green : .red)
            }
        }
        .frame(width: 170)
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.theme.dark)
        )
       
    }
}
