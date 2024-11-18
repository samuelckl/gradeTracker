//
//  LandingView.swift
//  GradeTracker
//
//  Created by Kin Lok Chan on 21/9/2024.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        VStack{Image("GradeTracker_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
            Text("Building80Coders")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.blue)
            
        }
    }
}

#Preview {
    LandingView()
}
