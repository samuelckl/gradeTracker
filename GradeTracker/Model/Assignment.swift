//
//  Assignment.swift
//  GradeTracker
//
//  Created by Kin Lok Chan on 20/9/2024.
//

import Foundation
import SwiftData

@Model
class Assignment: Identifiable {
    var id: UUID
    var title: String
    var weight: Double
    var startDate: Date
    var mark: Double? // Only set when marked

    init(id: UUID = UUID(), title: String = "", weight: Double = 0, startDate: Date = Date(), mark: Double? = nil) {
        self.id = id
        self.title = title
        self.weight = weight
        self.startDate = startDate
        self.mark = mark
    }
}
