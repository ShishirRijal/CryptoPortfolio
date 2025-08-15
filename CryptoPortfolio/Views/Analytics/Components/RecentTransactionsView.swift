//
//  RecentTransactionsView.swift
//  CryptoPortfolio
//
//  Created by Shishir Rijal on 14/08/2025.
//

import SwiftUI

struct RecentTransactionsView: View {
    
//    let _dummyTransactions: [Transaction] = [
//        Transaction(type: TransactionType.receive, date: "20 March", amount: 0.002167, coin: "BTC"),
//        Transaction(type: TransactionType.send, date: "21 March", amount: 0.002167, coin: "ETH"),
//        Transaction(type: TransactionType.receive, date: "23 March", amount: 0.002167, coin: "BTC")
//    ]
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Recent Transactions")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.white)
                
                Spacer()
            }
            
            VStack(spacing: 12) {
                ForEach(transactions) { transaction in
                    CustomRoundCard(icon: transaction.coin.icon, systemIcon: nil, name: transaction.type.displayName, label: transaction.date, trailingLabel: transaction.coin.symbolName, value: transaction.amount, isGray: false)
                }
            }
        }
    }
}

