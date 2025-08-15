//
//  Currency.swift
//  CryptoPortfolio
//
//  Created by Shishir Rijal on 15/08/2025.
//

import Foundation

enum CurrencyType {
    case inr, usd, bitcoin
    
    var symbol: String {
        switch self {
        case .inr:
            return "₹"
        case .usd:
            return "$"
        case .bitcoin:
            return "₿"
        }
    }
    
    var displayName: String {
        switch self {
        case .inr:
            return "INR"
        case .usd:
            return "USD"
        case .bitcoin:
            return "BTC"
        }
    }
}
