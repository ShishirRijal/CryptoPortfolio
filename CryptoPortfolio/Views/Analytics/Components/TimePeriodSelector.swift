//
//  TimePeriodSelector.swift
//  CryptoPortfolio
//
//  Created by Shishir Rijal on 15/08/2025.
//

import SwiftUI

struct TimePeriodSelector: View {
    @Binding var selectedPeriod: TimePeriod
    let onPeriodChange: (TimePeriod) -> Void
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(TimePeriod.allCases, id: \.self) { period in
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        selectedPeriod = period
                        onPeriodChange(period)
                    }
                }) {
                    Text(period.rawValue)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(selectedPeriod == period ? .white : .white.opacity(0.6))
                        .frame(width: 40, height: 32)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(selectedPeriod == period ?  Color.gray : Color.clear)
                        )
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    TimePeriodSelector(selectedPeriod: .constant(.sixMonths)) { _ in }
        .background(Color.dark)
        .preferredColorScheme(.dark)
}
