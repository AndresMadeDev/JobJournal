//
//  JournalModel.swift
//  JobJournal
//
//  Created by Andres Made on 12/25/23.
//

import SwiftUI
import SwiftData

@Model
class JournalModel {
    var dateAdded: Date
    var title: String = ""
    var desc: String = ""
    var type: TypeOf.RawValue
    
    init(dateAdded: Date = .now, title: String, desc: String, type: TypeOf = .acomplishment) {
        self.dateAdded = dateAdded
        self.title = title
        self.desc = desc
        self.type = type.rawValue
    }
    
    var colorType: Color {
        switch TypeOf(rawValue: type)! {
        case .acomplishment:
            Color.teal
        case .challanges:
            Color.orange
        case .notes:
            Color.blue
        case .coaching:
            Color.purple
        case .award:
            Color.green
        }
    }
    
}



enum TypeOf: String, Codable, Identifiable, CaseIterable {
    case acomplishment, challanges, notes, coaching, award
    
    var id: Self {
        self
    }
    
    var type: String {
        switch self {
        case .acomplishment:
            "Acomplishments"
        case .challanges:
            "Challanges"
        case .notes:
            "Notes"
        case .coaching:
            "Coaching"
        case .award:
            "Awards"
        }
    }
    
}
