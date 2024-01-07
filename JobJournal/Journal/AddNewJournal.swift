//
//  AddNewJournal.swift
//  JobJournal
//
//  Created by Andres Made on 12/25/23.
//

import SwiftUI

struct AddNewJournal: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var desc: String = ""
    @State private var date: Date = .now
    @State private var typeOf = TypeOf.acomplishment
    
    var body: some View {
        Form {
            Section {
                DatePicker("Date", selection: $date, displayedComponents: .date)
            }
            
            Section {
                Picker("Entry Type", selection: $typeOf) {
                    ForEach(TypeOf.allCases) { typeOf in
                        Text(typeOf.type).tag(typeOf)
                    }
                }
                .pickerStyle(.menu)
            }
            
            Section {
                TextField("Title", text: $title)
                TextEditor(text: $desc)
                    .frame(height: 200)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Create") {
                    let newJournal = JournalModel(dateAdded: date,
                                                  title: title,
                                                  desc: desc,
                                                  type: typeOf)
                    context.insert(newJournal)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddNewJournal()
}
