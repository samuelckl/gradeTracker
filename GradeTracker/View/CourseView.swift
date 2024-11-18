//
//  CourseView.swift
//  GradeTracker
//
//  Created by Abdullah Alabbad on 21/9/2024.
//

import SwiftUI
import SwiftData

struct CourseView: View {
    
    @State private var showingSheet = false
    var course: Course
    @State var navigated = false
    
    @State var assignmentToEdit: Assignment?
    
    var body: some View {
        NavigationStack{
            List {
                Section {
                    CourseSummaryCardView(goal: course.goal, assignments: course.assignments)
                }
                
                Section(header: HStack {
                    Text("Assignment")
                    Spacer()
                    Button("", systemImage: "plus") {
                        showingSheet.toggle()
                    }
                    .padding(.bottom, 5)
                }) {
                    ForEach(course.assignments) { assignment in
                        HStack {
                            Text(assignment.title)
                            Spacer()
                            HStack {
                                if (assignment.mark != nil) {
                                    Text(assignment.mark!.truncated)
                                        .foregroundStyle(Color(red: 58/255, green: 175/255, blue: 88/255))
                                } else {
                                    Text("-")
                                        .foregroundStyle(.secondary)
                                }
                                Text("/")
                                    .foregroundStyle(.secondary)
                                Text(assignment.weight.truncated)
                            }
                        }
                        .swipeActions {
                            Button("Edit", action: { assignmentToEdit = assignment })
                                .tint(.blue)
                        }
                        
                    }
                }
            }
            .sheet(isPresented: $showingSheet) {
                NewAssignmentSheetView(course: course)
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            }
            .sheet(item: $assignmentToEdit) { assignment in
                EditAssignmentView(assignment: assignment)
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Course.self, configurations: config)
        return NavigationStack {
            CourseView(course: Course(
                id: UUID(),
                title: "iPhone Software Engineering",
                credits: 12,
                goal: 80.0
            ))
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink {
                        Text("edit")
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
        }
        .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}

