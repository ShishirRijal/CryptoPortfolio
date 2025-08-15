//
//  AppTabBar.swift
//  CryptoPortfolio
//
//  Created by Shishir Rijal on 13/08/2025.
//

import SwiftUI

struct AppTabBar: View {
    @Binding var selection: Tab
    var body: some View {
        HStack {
            
            // TabBar Buttons
            HStack {
                TabBarButton(title: "Analytics", system: "chart.xyaxis.line", tab: .analytics, selection: $selection)
                TabBarButton(title: "Exchange", system: "arrow.triangle.2.circlepath", tab: .exchange, selection: $selection)
                TabBarButton(title: "Record", system: "doc.on.doc", tab: .record, selection: $selection)
                TabBarButton(title: "Wallet", system: "wallet.pass", tab: .wallet, selection: $selection)
            }
            .padding(.horizontal, 4)
            .padding(.vertical, 4)
            
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 52, style: .continuous))
            
           
            // Add button
            if(selection == Tab.analytics) {
                Button {
                    let generator = UIImpactFeedbackGenerator(style: .soft)
                               generator.impactOccurred()
                       
                        } label: {
                            Image(systemName: "plus")
                                   .font(.system(size: 24, weight: .regular))
                                   .foregroundStyle(Color.theme.blue)
                                   .frame(width: 62, height: 62)
                                   .background(.white)
                                   .clipShape(Circle())
                        
                    }
                    .buttonStyle(.plain)
            }
            
        }
        .frame(height: 62)
       
    }
}

#Preview {
    @Previewable @State var selection: Tab = .analytics
    AppTabBar(selection: $selection)
}
