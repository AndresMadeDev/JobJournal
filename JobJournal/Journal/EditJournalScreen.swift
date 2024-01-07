//
//  EditJournal.swift
//  JobJournal
//
//  Created by Andres Made on 12/25/23.
//

import SwiftUI
import SwiftData

struct EditJournalScreen: View {
    @Bindable var journal: JournalModel
    @State private var typeOf = TypeOf.self
    
    var body: some View {
        Form {
            Section {
                DatePicker("Date", selection: $journal.dateAdded, displayedComponents: .date)
            }
            
            Section {
                Picker("Entry Type", selection: $journal.type) {
                    ForEach(TypeOf.allCases) {
                        Text($0.rawValue.capitalized)
                    }
                }
                .pickerStyle(.menu)
            }
            
            Section {
                TextField("Title", text: $journal.title)
                TextEditor(text: $journal.desc)
                    .frame(height: 200)
            }
        }
        .navigationTitle(journal.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}


