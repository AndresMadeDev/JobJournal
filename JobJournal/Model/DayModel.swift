//
//  DayModel.swift
//  JobJournal
//
//  Created by Andres Made on 1/1/24.
//

import SwiftUI
import SwiftData

@Model
class DayModel {
    var date: Date
    var comment: String = ""
    var dayAdded: Bool = false
    var rating: Rating.RawValue
    
    init(date: Date = .now, comment: String = "",dayAdded: Bool = false, rating: Rating = .normal) {
        self.date = date
        self.comment = comment
        self.dayAdded = dayAdded
        self.rating = rating.rawValue
    }
    
    var colorRating: Color {
        switch Rating(rawValue: rating)!{
        case .bad:
            Color.pink
        case .normal:
            Color.gray
        case .great:
            Color.green
        }
    }
    
}

enum Rating: String, Codable, Identifiable, CaseIterable {
    case bad, normal, great
    
    var id: Self {
        self
    }
    
    var type: String {
        switch self {
        case .bad:
            "Bad"
        case .normal:
            "Normal"
        case .great:
            "Great"
        }
    }
}
