//
//  ContentView.swift
//  GradeTracker
//
//  Created by Abdullah Alabbad on 20/9/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showLandingView = true
    
    var body: some View {
        ZStack {
            if showLandingView {
                LandingView()
            } else {
                MainView()
            }
        }
        .onAppear {
            // Set up a delay before switching views
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    showLandingView = false
                }
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Semester.self, Course.self, configurations: config)
        
        return ContentView()
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container: \(error)")
    }
    
}

