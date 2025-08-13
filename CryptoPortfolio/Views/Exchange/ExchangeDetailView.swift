//
//  ExchangeDetailView.swift
//  CryptoPortfolio
//
//  Created by Shishir Rijal on 13/08/2025.
//

import SwiftUI

struct ExchangeDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var fromCurrency: String = "ETH"
    @State private var toCurrency: String = "INR"
    @State private var fromAmount: String = "2.640"
    @State private var toAmount: String = "4,65,006.44"
    @State private var exchangeType: ExchangeType = .send
    
    var body: some View {
        ZStack {
            // Background
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Exchange Cards Container
                ZStack(alignment: .center) {
                    VStack() {
                        // From Currency Card
                        ExchangeCurrencyCard(
                            currencyIcon: "Ethereum",
                            currencyCode: fromCurrency,
                            amount: fromAmount,
                            balanceLabel: "Balance",
                            balanceAmount: "10.254",
                            actionText: exchangeType.rawValue.capitalized,
                            isFromCard: true,
                            isLower: false
                        )
                        
                        // To Currency Card
                        ExchangeCurrencyCard(
                            currencyIcon: "INR",
                            currencyCode: toCurrency,
                            amount: "₹ \(toAmount)",
                            balanceLabel: "Balance",
                            balanceAmount: "4,35,804",
                            actionText: "Receive",
                            isFromCard: false,
                            isLower: true
                        )
                    }
                  
                    
                    // Exchange Toggle Button
                    ExchangeToggleButton()
                }
                .padding(.horizontal, 16)
//                    .padding(.top, 30)
                
        
                
                // Exchange Button
                ExchangeActionButton()
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                    .padding(.top, 8)
                
                // Exchange Details
                ExchangeDetailsSection()
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                }
            }
            
            ToolbarItem(placement: .principal) {
                Text("Exchange")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
            }
        }
        .padding(0)
    }
}

 
// MARK: - Exchange Currency Card
struct ExchangeCurrencyCard: View {
    let currencyIcon: String
    let currencyCode: String
    let amount: String
    let balanceLabel: String
    let balanceAmount: String
    let actionText: String
    let isFromCard: Bool
    let isLower: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            // Header Row
            HStack {
                HStack(spacing: 12) {
                    Image(currencyIcon)
                        .font(.system(size: 24))
                        .frame(width: 40, height: 40)
                        .background(Color.theme.dark)
                        .clipShape(Circle())
                    
                    HStack(spacing: 4) {
                        Text(currencyCode)
                            .font(.system(size: 20, weight: .regular))
                            .foregroundColor(.gray)
                        
                        Image(systemName: "chevron.down")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.white.opacity(0.6))
                    }
                }
                
                Spacer()
                
                Text(actionText)
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.8))
            }
            
            // Amount Section
            HStack {
                Text(amount)
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(.white)
                
                Spacer()
            }
            
            // Balance Section
            HStack {
                Text(balanceLabel)
                Spacer()
                Text(balanceAmount)
            }
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(.white.opacity(0.4))
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 28)
        .background(
            UnevenRoundedRectangle(
                topLeadingRadius: isLower ? 0: 16,
                bottomLeadingRadius: isLower ? 16: 0,
                bottomTrailingRadius: isLower ? 16: 0,
                topTrailingRadius: isLower ? 0: 16,
            )
            .fill(Color.theme.dark)
        )
    }
}

// MARK: - Exchange Toggle Button
struct ExchangeToggleButton: View {
    var body: some View {
        Button(action: {
            // Handle exchange toggle
        }) {
            Image(systemName: "arrow.up.arrow.down")
                .font(.system(size: 20))
                .foregroundColor(.white)
                .frame(width: 52, height: 52)
                .background(
                    .black
                )
                .cornerRadius(8)
                .padding(1)
                .background(.white.opacity(0.12))
                .cornerRadius(8)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(stops: [
                                    .init(color: Color(red: 0.082, green: 0.082, blue: 0.090), location: 0.0),
                                    .init(color: Color(red: 0.051, green: 0.047, blue: 0.051), location: 1.0)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                       
                      
                )
                .cornerRadius(12)
        }
    }
}

// MARK: - Exchange Action Button
struct ExchangeActionButton: View {
    var body: some View {
        Button(action: {
            // Handle exchange action
        }) {
            Text("Exchange")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(
                    RoundedRectangle(cornerRadius: 28)
                        .fill(Color.theme.blue)
                )
        }
    }
}

// MARK: - Exchange Details Section
struct ExchangeDetailsSection: View {
    var body: some View {
        VStack(spacing: 16) {
            ExchangeDetailRow(title: "Rate", value: "1 ETH = ₹ 1,76,138.80")
            ExchangeDetailRow(title: "Spread", value: "0.2%")
            ExchangeDetailRow(title: "Gas fee", value: "₹ 422.73")
            
            Divider()
                .background(Color.white.opacity(0.2))
            
            ExchangeDetailRow(
                title: "You will receive",
                value: "₹ 1,75,716.07",
                isTotal: true
            )
        }
    }
}

// MARK: - Exchange Detail Row
struct ExchangeDetailRow: View {
    let title: String
    let value: String
    let isTotal: Bool
    
    init(title: String, value: String, isTotal: Bool = false) {
        self.title = title
        self.value = value
        self.isTotal = isTotal
    }
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: isTotal ? 16 : 14, weight: isTotal ? .semibold : .medium))
                .foregroundColor(.white.opacity(isTotal ? 1.0 : 0.6))
            
            Spacer()
            
            Text(value)
                .font(.system(size: isTotal ? 16 : 14, weight: isTotal ? .semibold : .medium))
                .foregroundColor(.white.opacity(isTotal ? 1.0 : 0.8))
        }
    }
}

// MARK: - Supporting Types
enum ExchangeType: String, CaseIterable {
    case send = "send"
    case receive = "receive"
}

#Preview {
    ExchangeDetailView()
        .preferredColorScheme(.dark)
}
