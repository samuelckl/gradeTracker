//
//  AddSemesterView.swift
//  GradeTracker
//
//  Created by Kin Lok Chan on 21/9/2024.
//

import SwiftUI
import SwiftData

struct AddSemesterView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var semester: Semester = Semester()
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Semester Details")){
                    LabeledContent("Title"){
                        TextField("title", text: $semester.title)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("New Semester")
            .toolbar{
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }.foregroundColor(.red)
                }
                ToolbarItem(placement: .primaryAction) {
                    Button("Add", action: AddSemester)
                }
            }
        }
    }
    
    func AddSemester(){
        let newSemester = Semester(title: semester.title)
        semester.title = ""
        modelContext.insert(newSemester)
        dismiss()
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Semester.self, configurations: config)
        return AddSemesterView()
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}



