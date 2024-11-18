//
//  EditAssignmentView.swift
//  GradeTracker
//
//  Created by Mao Mingjian on 21/9/2024.
//

import SwiftUI
import SwiftData

struct EditAssignmentView: View {
    @Bindable var assignment: Assignment

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Assignment Details")){
                    LabeledContent("Title"){
                        TextField("title", text: $assignment.title)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    LabeledContent("Weight"){
                        TextField("Weight", value: $assignment.weight, format: .number)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    LabeledContent("Mark"){
                        TextField("Mark", value: $assignment.mark, format: .number)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    DatePicker(
                        "Start Date",
                        selection: $assignment.startDate,
                        displayedComponents: [.date]
                    )
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Edit Assignment")
            .toolbar{
                ToolbarItem(placement: .primaryAction) {
                    Button("Cancel") {
                        dismiss()
                    }.foregroundColor(.red)
                }
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Course.self, configurations: config)
        let example = Assignment(
            id: UUID(),
            title: "Assignment 1",
            weight: 20,
            mark: 12
        )
        return EditAssignmentView(assignment: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }

}
