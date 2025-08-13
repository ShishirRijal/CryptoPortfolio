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
            .foregroundStyle(isSelected ? .white : .secondary)
            .frame(width: 73.25, height: 55)
            .padding(.vertical, 8)
            .padding(.horizontal, isSelected ? 10: 0)
            .background(
                ZStack {
                    if isSelected {
                        let base = Color(red: 34/255, green: 45/255, blue: 236/255)
                        let overlay = Color(red: 111/255, green: 136/255, blue: 250/255).opacity(0.32)
                        RoundedRectangle(cornerRadius: 44, style: .continuous)
                            .fill(base)
                        RoundedRectangle(cornerRadius: 44, style: .continuous)
                            .fill(overlay)
                            .blendMode(.overlay)
                        RoundedRectangle(cornerRadius: 44, style: .continuous)
                            .stroke(Color.white.opacity(0.12), lineWidth: 0.5)
                            .shadow(color: Color.white.opacity(0.12), radius: 4, x: 0, y: 2)
                            .clipShape(RoundedRectangle(cornerRadius: 44, style: .continuous))
                    }
                }
            )
            .clipShape(RoundedRectangle(cornerRadius: 44, style: .continuous))
            .contentShape(RoundedRectangle(cornerRadius: 44, style: .continuous))
        }
        .buttonStyle(.plain)
    }
}




 


#Preview {
    @Previewable @State var selectedTab = Tab.analytics
    TabBarButton(title: "Analytics", system: "chart.xyaxis.line", tab: Tab.analytics, selection:    $selectedTab)
}
