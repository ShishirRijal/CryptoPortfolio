//
//  ExchangeViewHeader.swift
//  CryptoPortfolio
//
//  Created by Shishir Rijal on 13/08/2025.
//

import SwiftUI

struct ExchangeViewHeader: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "line.3.horizontal")
            }
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "bell")
            }
        }
        .font(.system(size: 24))
        .foregroundColor(.white)
        .padding(.horizontal, 20)
    }
}
