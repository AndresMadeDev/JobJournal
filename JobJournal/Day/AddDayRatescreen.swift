//
//  AddDayRatescreen.swift
//  JobJournal
//
//  Created by Andres Made on 1/2/24.
//

import SwiftUI

struct AddDayRatescreen: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @Bindable var day: DayModel
    
    @State private var comment: String = ""
    @State private var date: Date = .now
    @State private var rating: Rating = .normal
    
    var body: some View {
        Form {
            Section("Rate you day") {
                Picker("How was your date", selection: $day.rating) {
                    ForEach(Rating.allCases) { i in
                        Text(i.rawValue.capitalized).tag(i.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
            Section("Leave a note about your day") {
                TextEditor(text: $day.comment)
                    .frame(height: 200)
            }
//            Section {
//                Toggle("Save", isOn: $day.dayAdded)
//            }
        }
        .navigationTitle(day.date.formatted(.dateTime.weekday().month().day()))
        .onAppear {
            day.dayAdded = true
        }
    }
}


