//
//  Transaction.swift
//  CryptoPortfolio
//
//  Created by Shishir Rijal on 13/08/2025.
//

import Foundation

class Transaction: ObservableObject, Identifiable {
    let id = UUID()
    var type: TransactionType
    var date: String
    var amount: Double
    var coin: String
    
    init(type: TransactionType, date: String, amount: Double, coin: String) {
        self.type = type
        self.date = date
        self.amount = amount
        self.coin = coin
    }
}




enum TransactionType {
    case receive, send
    
    var displayName: String {
        switch self {
        case .receive:
            return "Received"
        case .send:
            return "Sent"
        }
    }
    
    var iconName: String {
        switch self {
        case .receive:
            return "arrow.down"
        case .send:
            return "arrow.up"
        }
    }
}

// Dummy Transactions
var transactions: [Transaction] = [
    Transaction(type: .receive, date: "20 March", amount: 0.002126, coin: "BTC"),
    Transaction(type: .send, date: "19 March", amount: -0.003126, coin: "ETH"),
    Transaction(type: .send, date: "18 March", amount: -0.02126, coin: "LTC"),
    Transaction(type: .receive, date: "17 March", amount: 0.001245, coin: "BTC"),
    Transaction(type: .send, date: "16 March", amount: -0.005678, coin: "ETH"),
    Transaction(type: .receive, date: "15 March", amount: 0.008932, coin: "LTC"),
    Transaction(type: .receive, date: "14 March", amount: 0.001567, coin: "BTC"),
    Transaction(type: .send, date: "13 March", amount: -0.002334, coin: "ETH")
]
