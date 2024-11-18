//
//  NewAssignmentSheetView.swift
//  GradeTracker
//
//  Created by Abdullah Alabbad on 21/9/2024.
//

import SwiftUI

struct NewAssignmentSheetView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var newAssignment = Assignment()
    var course: Course
    
    var body: some View {
        Form {
            
            Section {
                LabeledContent("Title") {
                    TextField("title", text: $newAssignment.title)
                        .multilineTextAlignment(.trailing)
                }
                LabeledContent("Weight") {
                    TextField("Weight", value: $newAssignment.weight, format: .number)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                }
                LabeledContent("Mark") {
                    TextField("Mark", value: $newAssignment.mark, format: .number)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                }
                DatePicker(
                    "Start Date",
                    selection: $newAssignment.startDate,
                    displayedComponents: [.date]
                )
            }
            
            Section {
                Button("Create") {
                    course.assignments.append(newAssignment)
                    dismiss()
                }
            }
            
            
        }
    }
}
