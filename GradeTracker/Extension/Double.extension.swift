//
//  Double.extension.swift
//  GradeTracker
//
//  Created by Abdullah Alabbad on 20/9/2024.
//

import Foundation

extension Double {
    var truncated: String {
        return self.truncatingRemainder(dividingBy: 1) == 0
            ? String(format: "%.0f", self) // No decimals
            : String(format: "%.2f", self) // Two decimals
    }
}
