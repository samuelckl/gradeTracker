//
//  SemesterPickingView2.swift
//  GradeTracker
//
//  Created by Kin Lok Chan on 21/9/2024.
//

import SwiftUI
import SwiftData

struct SemesterPickingView: View {
    @Environment(\.modelContext) var modelContext
    @Query var semesters: [Semester]
    
    @Binding var selectedSemester: Semester?
    
    var body: some View {
        HStack{
            VStack {
                if semesters.isEmpty {
                    Text("Please add a semester.")
                        .foregroundColor(.red)
                } else {
                    Picker("Select a Semester", selection: $selectedSemester) {
                        ForEach(semesters) { semester in
                            Text(semester.title).tag(semester as Semester?)
                        }
                    }
                }
            }
            
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Semester.self, configurations: config)
        
        return SemesterPickingView(selectedSemester: .constant(nil))
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container: \(error)")
    }
}
