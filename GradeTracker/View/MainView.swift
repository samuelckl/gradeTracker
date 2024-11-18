//
//  MainView.swift
//  GradeTracker
//
//  Created by Kin Lok Chan on 21/9/2024.
//

import SwiftUI

struct MainView: View{
    @Environment(\.modelContext) var modelContext
    @State private var selectedSemester: Semester? = Semester()
    @State private var showingSheet = false
    
    var body: some View {
        VStack{
            
            NavigationStack {
                Form {
                    
                    HStack{
                        SemesterPickingView(selectedSemester: $selectedSemester)
                            .toolbar {
                                ToolbarItem(placement: .navigation) {
                                    Text("Semester Info")
                                        .font(.title)
                                        .bold()
                                }
                                ToolbarItem(placement: .primaryAction) {
                                    NavigationLink {
                                        AddSemesterView()
                                    } label: {
                                        Image(systemName: "plus")
                                    }
                                }
                            }
                    }
                    if (selectedSemester != nil) {
                        CoursesListingView(semester: $selectedSemester)
                    }
                    
                }
            }
            .sheet(isPresented: $showingSheet) {
                AddCourseView(selectedSemester: $selectedSemester)
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

