//
//  AnalyticsView.swift
//  CryptoPortfolio
//
//  Created by Shishir Rijal on 13/08/2025.
//

import SwiftUI


struct AnalyticsView: View {
    @State private var selectedCurrency: CurrencyType = .inr
    @StateObject private var chartData = PortfolioChartData()

 
    var body: some View {
        ZStack {
            // Background gradient
            Color.dark
                
            ScrollView {
                VStack(spacing: 0) {
                  
                    HeaderView(selectedCurrency: $selectedCurrency, amount: chartData.formattedCurrentValue)
                    
 //                    // Interactive Portfolio Chart
                    PortfolioChartView(selectedCurrency: $selectedCurrency)
                        .padding(.horizontal, 16)
 
                  
                    // Asset Cards
                    AssetCardsView()
                        .padding(.horizontal, 20)
                        .padding(.top, 30)
                    
                    // Recent Transactions
                    RecentTransactionsView()
                        .padding(.horizontal, 20)
                        .padding(.top, 30)
                        .padding(.bottom, 120) // Extra padding for tab bar
                }
                
            }
        }
        .onAppear {
            chartData.selectedCurrency = selectedCurrency
            chartData.generateMockData(for: chartData.selectedPeriod)
        }
        .onChange(of: selectedCurrency) { newCurrency in
            chartData.selectedCurrency = newCurrency
            chartData.generateMockData(for: chartData.selectedPeriod)
        }
       
    }
}
 

#Preview {
    AnalyticsView()
        .preferredColorScheme(.dark)
}



