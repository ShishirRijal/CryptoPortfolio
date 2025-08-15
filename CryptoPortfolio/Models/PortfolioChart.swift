//
//  PortfolioChart.swift
//  CryptoPortfolio
//
//  Created by Shishir Rijal on 15/08/2025.
//

import Foundation

struct PortfolioDataPoint: Identifiable, Equatable {
    let id = UUID()
    let date: Date
    let value: Double
}

class PortfolioChartData: ObservableObject {
    @Published var dataPoints: [PortfolioDataPoint] = []
    @Published var selectedPeriod: TimePeriod = .sixMonths
    @Published var selectedCurrency: CurrencyType = .inr
    
    func generateMockData(for period: TimePeriod) {
        let calendar = Calendar.current
        let endDate = Date()
        let startDate: Date
        let interval: TimeInterval
        let numberOfPoints: Int
        
        switch period {
        case .oneHour:
            startDate = calendar.date(byAdding: .hour, value: -1, to: endDate)!
            interval = 300 // 5 minutes
            numberOfPoints = 7
        case .eightHours:
            startDate = calendar.date(byAdding: .hour, value: -8, to: endDate)!
            interval = 1800 // 30 minutes
            numberOfPoints = 8
        case .oneDay:
            startDate = calendar.date(byAdding: .day, value: -1, to: endDate)!
            interval = 3600 // 1 hour
            numberOfPoints = 6
        case .oneWeek:
            startDate = calendar.date(byAdding: .day, value: -7, to: endDate)!
            interval = 21600 // 6 hours
            numberOfPoints = 5
        case .oneMonth:
            startDate = calendar.date(byAdding: .month, value: -1, to: endDate)!
            interval = 86400 // 1 day
            numberOfPoints = 9
        case .sixMonths:
            startDate = calendar.date(byAdding: .month, value: -6, to: endDate)!
            interval = 604800 // 1 week
            numberOfPoints = 7
        case .oneYear:
            startDate = calendar.date(byAdding: .year, value: -1, to: endDate)!
            interval = 1209600 // 2 weeks
            numberOfPoints = 12
        }
        
        var points: [PortfolioDataPoint] = []
        let baseValue: Double = selectedCurrency == .inr ? 142340 : 
                               selectedCurrency == .bitcoin ? 2.1 : 1750
        
        for i in 0..<numberOfPoints {
            let date = Date(timeInterval: interval * Double(i), since: startDate)
            
            // Create realistic portfolio growth with some volatility
            let progress = Double(i) / Double(numberOfPoints - 1)
            let growth = 1.0 + (progress * 0.25) // 25% growth over the period
            let volatility = sin(Double(i) * 0.8) * 0.05 + cos(Double(i) * 1.2) * 0.03
            let value = baseValue * growth * (1.0 + volatility)
            
            points.append(PortfolioDataPoint(date: date, value: value))
        }
        
        self.dataPoints = points
    }
    
    var currentValue: Double {
        dataPoints.last?.value ?? 0
    }
    
    var formattedCurrentValue: String {
        switch selectedCurrency {
        case .inr:
            return "₹\(String(format: "%.0f", currentValue).addingCommas())"
        case .bitcoin:
            return "\(String(format: "%.2f", currentValue)) BTC"
        case .usd:
            return "$\(String(format: "%.0f", currentValue).addingCommas())"
        }
    }
}

enum TimePeriod: String, CaseIterable {
    case oneHour = "1h"
    case eightHours = "8h"
    case oneDay = "1d"
    case oneWeek = "1w"
    case oneMonth = "1m"
    case sixMonths = "6m"
    case oneYear = "1y"
}

extension String {
    func addingCommas() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        if let number = Double(self) {
            return formatter.string(from: NSNumber(value: number)) ?? self
        }
        return self
    }
}
