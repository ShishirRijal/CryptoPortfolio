//
//  ActionButton.swift
//  CryptoPortfolio
//
//  Created by Shishir Rijal on 13/08/2025.
//

import SwiftUI

struct ActionButton: View {
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(.white)
                .frame(width: 52, height: 52)
                .background(
                    ZStack {
                        // Background gradient
                        LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: Color(red: 0.1, green: 0.098, blue: 0.106), location: 0.119),
                                .init(color: Color(red: 0.055, green: 0.055, blue: 0.063), location: 1.24)
                            ]),
                            startPoint: UnitPoint(x: 0.2, y: 0.15),
                            endPoint: UnitPoint(x: 0.8, y: 0.85)
                        )
                        
                    }
                )
                .clipShape(.circle)
        }
        .buttonStyle(.plain)
    }
}
