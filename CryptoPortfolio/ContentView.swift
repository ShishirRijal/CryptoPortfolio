//
//  ContentView.swift
//  CryptoPortfolio
//
//  Created by Shishir Rijal on 13/08/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .analytics
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selection) {
               NavigationStack { AnalyticsView() }
                   .tag(Tab.analytics)
               NavigationStack { ExchangeView() }
                   .tag(Tab.exchange)
               NavigationStack { RecordView() }
                   .tag(Tab.record)
               NavigationStack { WalletView() }
                   .tag(Tab.wallet)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea(.all)
            
            AppTabBar(selection: $selection)
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)

}
