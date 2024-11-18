//
//  AddCourse.swift
//  GradeTracker
//
//  Created by Mao Mingjian on 21/9/2024.
//

import SwiftUI
import SwiftData

struct AddCourseView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var course: Course = Course()
    @State private var newAssignment = ""
    
    @Binding var selectedSemester: Semester?
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Course Details")){
                    LabeledContent("Title"){
                        TextField("title", text: $course.title)
                    }
                    
                    LabeledContent("Credits"){
                        TextField("Credits", value: $course.credits, format: .number)
                    }
                    
                    LabeledContent("Goal"){
                        TextField("Goal", value: $course.goal, format: .number)
                    }   
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("New Course")
            .toolbar{
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }.foregroundColor(.red)
                }
                ToolbarItem(placement: .primaryAction) {
                    Button("Add", action: AddCourse)
                }
            }
        }
    }
    
    func AddCourse(){
        if selectedSemester != nil {
            selectedSemester?.courses.append(course)
        }
        dismiss()
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Course.self, configurations: config)
        return AddCourseView(selectedSemester: .constant(nil))
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
