//
//  PortfolioChartView.swift
//  CryptoPortfolio
//
//  Created by Shishir Rijal on 15/08/2025.
//

import SwiftUI

struct PortfolioChartView: View {
    @StateObject private var chartData = PortfolioChartData()
    @Binding var selectedCurrency: CurrencyType
    
    var body: some View {
        VStack(spacing: 0) {
       
           
            // Time period selector
            TimePeriodSelector(selectedPeriod: $chartData.selectedPeriod) { period in
                chartData.generateMockData(for: period)
            }
            
            // Interactive chart
            InteractiveLineChart(dataPoints: chartData.dataPoints)
                .frame(height: 200)
 
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
    PortfolioChartView(selectedCurrency: .constant(.inr))
        .padding()
        .background(Color.dark)
        .preferredColorScheme(.dark)
}
