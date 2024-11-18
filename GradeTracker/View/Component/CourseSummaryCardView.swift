//
//  CourseSummaryCardView.swift
//  GradeTracker
//
//  Created by Abdullah Alabbad on 20/9/2024.
//

import SwiftUI
import SwiftData

struct CourseSummaryCardView: View {
    
    var goal: Double?
    var assignments: [Assignment]
    
    var body: some View {
        let totalMark = assignments.reduce(0) { $0 + ($1.mark ?? 0) }
        let totalWeight = assignments.reduce(0) { $0 + $1.weight }
        let totalWeight2 = totalWeight < 100 ? 100 : totalWeight
        let remaining = (goal ?? 0) - totalMark
        
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 18) {
                    VStack(alignment: .leading) {
                        Text("Gained marks")
                            .bold()
                        HStack {
                            Text("\(totalMark.truncated)%")
                            Text("/")
                            Text("\(totalWeight2.truncated)%")
                        }
                    }
                    if goal != nil {
                        VStack(alignment: .leading) {
                            Text("Target")
                                .bold()
                            HStack {
                                Text("\(goal!.truncated)%")
                            }
                        }
                    }
                }
                Spacer()
                if assignments.count > 0 {
                    ProgressDonutChart(current: totalMark, total: totalWeight2, mark: goal)
                        .frame(maxWidth: 164)
                } else {
                    ProgressDonutChart(current: 0, total: 100, mark: goal)
                        .frame(maxWidth: 164)
                }
            }
            if remaining > 0 {
                Text("\(remaining.truncated)% marks remainting to reach your target")
                    .foregroundStyle(.secondary)
                    .font(.caption)
                    .padding()
            }
            else {
                Text("Congrats! You've reached your target marks")
                    .foregroundStyle(.secondary)
                    .font(.caption)
                    .padding()
            }
        }
        .padding()
    }
    
    func mapPercentageToDegree(value: Double) -> Double {
        // Ensure the value is clamped between 0 and 100
        let clampedValue = min(max(value, 0), 100)
        
        // Map the value to degrees
        return (clampedValue / 100) * 360
    }

}

#Preview {
    CourseSummaryCardView(goal: 80, assignments: [
        .init(title: "Assignment 1", weight: 50, mark: 30.31),
        .init(title: "Assignment 2", weight: 50, mark: 30)
    ])
}

#Preview {
    CourseSummaryCardView(goal: 80, assignments: [
        .init(title: "Assignment 1", weight: 50, mark: 60.31),
        .init(title: "Assignment 2", weight: 50, mark: 30)
    ])
}
