//
//  EditCourseView.swift
//  GradeTracker
//
//  Created by Mao Mingjian on 21/9/2024.
//

import SwiftUI
import SwiftData


struct EditCourseView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @Bindable var course: Course

    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Course Details")){
                    LabeledContent("Title"){
                        TextField("title", text: $course.title)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    LabeledContent("Credits"){
                        TextField("Credits", value: $course.credits, format: .number)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    LabeledContent("Goal"){
                        TextField("Goal", value: $course.goal, format: .number)
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Edit Course")
            .toolbar{
                ToolbarItem(placement: .primaryAction) {
                    Button("Cancel") {
                        dismiss()
                    }.foregroundColor(.red)
                }
            }
        }
    }
    func SaveChanges(){
        
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
        return EditCourseView(course: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
