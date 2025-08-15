//
//  TabBarButton.swift
//  CryptoPortfolio
//
//  Created by Shishir Rijal on 13/08/2025.
//

import SwiftUI

enum Tab: Int, CaseIterable { case analytics, exchange, record, wallet }

struct TabBarButton: View {
    var title: String
    var system: String
    var tab: Tab
    @Binding var selection: Tab
    var body: some View {
        Button {
            selection = tab
            let generator = UIImpactFeedbackGenerator(style: .soft)
            generator.impactOccurred()
        } label: {
            let isSelected = selection == tab
            VStack(spacing: 2) {
                Image(systemName: system)
                    .font(.system(size: 18, weight: .semibold))
                Text(title)
                    .font(.system(size: 12, weight: .semibold))
            }
            .foregroundStyle(isSelected ? .white : .theme.gray)
            .frame(width:  65, height: 55)
            .padding(.vertical, 8)
            .padding(.horizontal, isSelected ? 10 : 0)
            .background(
                ZStack {
                    if isSelected {
                        RoundedRectangle(cornerRadius: 44, style: .continuous)
                            .fill(Color.theme.blue)
                    }
                }
            )
            .clipShape(RoundedRectangle(cornerRadius: 44, style: .continuous))
        }
        .buttonStyle(.plain)
    }
}




 


#Preview {
    @Previewable @State var selectedTab = Tab.analytics
    TabBarButton(title: "Analytics", system: "chart.xyaxis.line", tab: Tab.analytics, selection:    $selectedTab)
}
