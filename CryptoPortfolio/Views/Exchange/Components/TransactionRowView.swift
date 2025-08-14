//
//  TransactionRowView.swift
//  CryptoPortfolio
//
//  Created by Shishir Rijal on 13/08/2025.
//

import SwiftUI

struct TransactionRowView: View {
    let transaction: Transaction
    
    var body: some View {
        NavigationLink(destination: ExchangeDetailView()) {
            CustomRoundCard(icon: nil, systemIcon: transaction.type.iconName, name: transaction.type.displayName, label: transaction.date, trailingLabel: transaction.coin, value: transaction.amount, isGray: true)
        }
        .buttonStyle(.plain)
    }
}
