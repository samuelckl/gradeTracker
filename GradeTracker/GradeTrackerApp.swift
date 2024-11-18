//
//  GradeTrackerApp.swift
//  GradeTracker
//
//  Created by Abdullah Alabbad on 20/9/2024.
//

import SwiftUI

@main
struct GradeTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Semester.self, Course.self, Assignment.self])
        }
    }
}
