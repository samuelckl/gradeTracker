//
//  ProgressDonutChart.swift
//  GradeTracker
//
//  Created by Abdullah Alabbad on 20/9/2024.
//

import SwiftUI
import Charts

struct ProgressDonutChart: View {
    
    var current: Double
    var total: Double
    var mark: Double?
    var color: Color = .blue
    var markColor: Color = .red
    
    
    var body: some View {
        let chartData = [
            (label: "total", value: current, color: color.gradient),
            (label: "remaining", value: total - current, color: color.opacity(0.2).gradient)
        ]
        
        
        let goalMark = [
            (label: "total", value: 1, color: markColor),
            (label: "remaining", value: 200, color: Color.clear)
        ]
        
        ZStack {
            Chart(chartData, id: \.0) { item in
                SectorMark(
                    angle: .value("Weight", item.value),
                    innerRadius: .ratio(0.7),
                    angularInset: 1
                    
                )
                .cornerRadius(4)
                .foregroundStyle(item.color)
            }
            .scaledToFit()
            .chartLegend(.hidden)
            
            if (mark != nil) {
                Chart(goalMark, id: \.0) { item in
                    SectorMark(
                        angle: .value("Weight", item.value),
                        innerRadius: .ratio(0.62)
                    )
                    .cornerRadius(5)
                    .foregroundStyle(item.color)
                }
                .scaledToFit()
                .scaleEffect(1.05)
                .chartLegend(.hidden)
                .rotationEffect(.degrees(mapPercentageToDegree(value: mark ?? 0)))
            }
        }
    }
    
    func mapPercentageToDegree(value: Double) -> Double {
        // Ensure the value is clamped between 0 and 100
        let clampedValue = min(max(value, 0), 100)
        
        // Map the value to degrees
        return (clampedValue / 100) * 360
    }
    
}

#Preview {
    ProgressDonutChart(current: 90, total: 100, mark: 80)
        .padding()
}
