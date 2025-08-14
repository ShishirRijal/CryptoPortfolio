//
//  CustomRoundCard.swift
//  CryptoPortfolio
//
//  Created by Shishir Rijal on 14/08/2025.
//

import SwiftUI

struct CustomRoundCard: View {
    let icon: String?
    let systemIcon: String?
    let name: String
    let label: String
    let trailingLabel: String
    let value: Double
    let isGray: Bool
    
    var body: some View {
        HStack(spacing: 16) {
            // Icon
            Group {
                if(icon != nil) {
                    Image(icon!)
                }
                else {
                    Image(systemName: systemIcon!)
                }
            }
                .foregroundStyle(.white)
                .frame(width: 24, height: 24)
                .padding(10)
                .background(isGray ? Color.gray : Color.theme.dark)
                .cornerRadius(12)
            
            // Transaction Info
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white)
                   
                Text(label)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.white.opacity(0.6))
            }
            
            Spacer()
            
            // Amount Info
            VStack(alignment: .trailing, spacing: 4) {
                Text(trailingLabel)
                Text(String(format: "%+.6f", value))
            }
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(.white)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.theme.dark)
        )
    }
}

#Preview {
    CustomRoundCard(
        icon: "Bitcoin", systemIcon: nil, name: "Bitcoin", label: "Value", trailingLabel: "Trailing", value: 394.2332, isGray: false
    )
}
