//
//  InteractiveLineChart.swift
//  CryptoPortfolio
//
//  Created by Shishir Rijal on 15/08/2025.
//

import SwiftUI

struct InteractiveLineChart: View {
    let dataPoints: [PortfolioDataPoint]
    @State private var selectedPoint: PortfolioDataPoint?
    @State private var showSelection: Bool = false
    @State private var animationProgress: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let padding: CGFloat = 20
            let chartWidth = width - (padding * 2)
            let chartHeight = height - 40
            
            if !dataPoints.isEmpty {
                ZStack {
                   
                    
                    VStack {
                        // Selected value display
                        HStack {
                            if let selectedPoint = selectedPoint {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(formatDate(selectedPoint.date))
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundColor(.white.opacity(0.7))
                                    
                                    Text(formatValue(selectedPoint.value))
                                        .font(.system(size: 20, weight: .semibold))
                                        .foregroundColor(.white)
                                }
                            }
                            Spacer()
                        }
                        .frame(height: 1)
                        .padding(.top, 20)
                       
                        
                        Spacer()
                        
                        // Chart area
                        ZStack {
                            // Background bars
                            ChartBarsBackground(dataPoints: dataPoints, 
                                              animationProgress: animationProgress,
                                              chartWidth: chartWidth,
                                              chartHeight: chartHeight,
                                              selectedPoint: selectedPoint)
                            
                            // Line path
                            ChartLinePath(dataPoints: dataPoints, 
                                        animationProgress: animationProgress)
                                .stroke(
                                    Color.green,
                                    style: StrokeStyle(lineWidth: 3, lineCap: .round)
                                )
                            
                            // Selection indicator
                            if showSelection, let selectedPoint = selectedPoint {
                                SelectionIndicator(
                                    dataPoints: dataPoints,
                                    selectedPoint: selectedPoint,
                                    chartWidth: chartWidth,
                                    chartHeight: chartHeight
                                )
                            }
                            
                            // Invisible touch area
                            Rectangle()
                                .fill(Color.clear)
                                .contentShape(Rectangle())
                                .gesture(
                                    DragGesture(minimumDistance: 0)
                                        .onChanged { value in
                                            handleTouch(at: value.location, 
                                                      chartWidth: chartWidth)
                                        }
                                        .onEnded { _ in
                                            withAnimation(.easeOut(duration: 0.2)) {
                                                showSelection = false
                                                selectedPoint = nil
                                            }
                                        }
                                )
                        }
                        .frame(height: chartHeight)
                      }
                }
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.5)) {
                animationProgress = 1.0
            }
            // Set default selection to a point that matches the image (around 70% through)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                if !dataPoints.isEmpty {
                    let defaultIndex = Int(Double(dataPoints.count) * 0.7)
                    selectedPoint = dataPoints[min(defaultIndex, dataPoints.count - 1)]
                    showSelection = true
                }
            }
        }
    }
    
    private func handleTouch(at location: CGPoint, chartWidth: CGFloat) {
        guard !dataPoints.isEmpty else { return }
        
        let xPosition = location.x
        let normalizedX = xPosition / chartWidth
        let index = Int(normalizedX * CGFloat(dataPoints.count - 1))
        let clampedIndex = max(0, min(index, dataPoints.count - 1))
        
        withAnimation(.easeInOut(duration: 0.2)) {
            selectedPoint = dataPoints[clampedIndex]
            showSelection = true
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM"
        return formatter.string(from: date)
    }
    
    private func formatValue(_ value: Double) -> String {
        return "₹\(String(format: "%.0f", value).addingCommas())"
    }
}

struct ChartLinePath: Shape {
    let dataPoints: [PortfolioDataPoint]
    var animationProgress: CGFloat
    
    var animatableData: CGFloat {
        get { animationProgress }
        set { animationProgress = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        guard dataPoints.count > 1 else { return Path() }
        
        let minValue = dataPoints.map(\.value).min() ?? 0
        let maxValue = dataPoints.map(\.value).max() ?? 1
        let valueRange = maxValue - minValue
        
        let xStep = rect.width / CGFloat(dataPoints.count - 1)
        
        var path = Path()
        let animatedCount = Int(CGFloat(dataPoints.count) * animationProgress)
        guard animatedCount > 0 else { return path }
        
        for (index, point) in dataPoints.prefix(animatedCount).enumerated() {
            let x = CGFloat(index) * xStep
            let normalizedValue = (point.value - minValue) / valueRange
            let y = rect.height - (CGFloat(normalizedValue) * rect.height)
            
            if index == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        return path
    }
}

struct SelectionIndicator: View {
    let dataPoints: [PortfolioDataPoint]
    let selectedPoint: PortfolioDataPoint
    let chartWidth: CGFloat
    let chartHeight: CGFloat
    
    var body: some View {
        if let index = dataPoints.firstIndex(where: { $0.id == selectedPoint.id }) {
            let minValue = dataPoints.map(\.value).min() ?? 0
            let maxValue = dataPoints.map(\.value).max() ?? 1
            let valueRange = maxValue - minValue
            
            let x = (CGFloat(index) / CGFloat(dataPoints.count - 1)) * chartWidth
            let normalizedValue = (selectedPoint.value - minValue) / valueRange
            let y = chartHeight - (CGFloat(normalizedValue) * chartHeight)
            
            ZStack {
                // Vertical line
                Rectangle()
                    .fill(Color.white.opacity(0.3))
                    .frame(width: 1)
                    .position(x: x, y: chartHeight / 2)
                
                // Selection dot
                Circle()
                    .fill(Color.white)
                    .frame(width: 8, height: 8)
                    .position(x: x, y: y)
                    .shadow(color: Color.theme.lightBlue, radius: 4)
            }
        }
    }
}

struct ChartBarsBackground: View {
    let dataPoints: [PortfolioDataPoint]
    let animationProgress: CGFloat
    let chartWidth: CGFloat
    let chartHeight: CGFloat
    let selectedPoint: PortfolioDataPoint?
    
    var body: some View {
        GeometryReader { geometry in
            if !dataPoints.isEmpty {
                let minValue = dataPoints.map(\.value).min() ?? 0
                let maxValue = dataPoints.map(\.value).max() ?? 1
                let valueRange = maxValue - minValue
                
                // Wider bars with more spacing to match the image
                let totalBars = CGFloat(dataPoints.count)
                let availableWidth = chartWidth * 0.85 // Use 85% of width for bars
                let barWidth: CGFloat = max(8, availableWidth / (totalBars * 1.2)) // Much wider bars
                let spacing = availableWidth / (totalBars - 1)
                
                let animatedCount = Int(CGFloat(dataPoints.count) * animationProgress)
                
                ZStack(alignment: .bottom) {
                    ForEach(Array(dataPoints.prefix(animatedCount).enumerated()), id: \.element.id) { index, point in
                        let normalizedValue = (point.value - minValue) / valueRange
                        let barHeight = CGFloat(normalizedValue) * chartHeight
                        let isSelected = selectedPoint?.id == point.id
                        
                        // Position each bar with proper spacing
                        let xPosition = (CGFloat(index) / CGFloat(dataPoints.count - 1)) * chartWidth
                        
                        Rectangle()
                            .fill(
                                LinearGradient(
                                    colors: isSelected ? [
                                        Color.theme.blue.opacity(1.0),
                                        Color.theme.blue.opacity(0.6)
                                    ] : [
                                        Color.gray.opacity(0.6),
                                        Color.gray.opacity(0.25)
                                    ],
                                    startPoint: .bottom,
                                    endPoint: .top
                                )
                            )
                            .frame(width: barWidth, height: barHeight)
                            .clipShape(
                                UnevenRoundedRectangle(
                                    topLeadingRadius: 3,
                                    bottomLeadingRadius: 0,
                                    bottomTrailingRadius: 0,
                                    topTrailingRadius: 3
                                )
                            )
                            .animation(
                                .easeOut(duration: 0.8)
                                .delay(Double(index) * 0.02),
                                value: animationProgress
                            )
                            .position(x: xPosition, y: chartHeight - barHeight / 2)
                    }
                }
            }
        }
    }
}

#Preview {
    let mockData = (0..<20).map { i in
        PortfolioDataPoint(
            date: Date().addingTimeInterval(TimeInterval(i * 3600)),
            value: 142340 + Double.random(in: -5000...5000)
        )
    }
    
    InteractiveLineChart(dataPoints: mockData)
        .frame(height: 300)
        .background(Color.dark)
        .preferredColorScheme(.dark)
}
