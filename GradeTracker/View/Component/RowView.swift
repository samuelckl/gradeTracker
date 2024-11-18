//
//  RowView.swift
//  GradeTracker
//
//  Created by Mao Mingjian on 20/9/2024.
//

import SwiftUI
import SwiftData

struct RowView<Content: View>: View {
    var item: String
    var rightView: Content
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item)
            }
            
            Spacer()
            VStack(alignment: .trailing){
                Text("Remaining")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                
                rightView
                    .frame(maxWidth: 40)
                
            }
        }
        .padding()
    }
}

#Preview {
    
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Course.self, configurations: config)
        let example = Course(
            id: UUID(),
            title: "iPhone Software Engineering",
            credits: 12,
            goal: 80.0
            )
        return RowView(item: example.title, rightView: ProgressDonutChart(current: 30, total: 100))
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
