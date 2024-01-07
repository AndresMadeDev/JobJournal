//
//  ContentView.swift
//  JobJournal
//
//  Created by Andres Made on 12/25/23.
//

import SwiftUI

enum SortOrder: String, Identifiable, CaseIterable {
    case all, acomplishment, challanges, notes, coaching, award
    
    var id: Self {
        self
    }
    
    var switchType: String {
        switch self {
        case .all:
            ""
        case .acomplishment:
            "acomplishment"
        case .challanges:
            "challanges"
        case .notes:
            "notes"
        case .coaching:
            "coaching"
        case .award:
            "award"
        }
    }
}


struct JournalHomeScreen: View {
    @State private var showNewJournal: Bool = false
    @State private var filter = ""
    @State private var typeOf = SortOrder.all
    
    var body: some View {
        NavigationStack {
            
            HStack{
                Text("Sort by:")
                Spacer()
                Picker("Entry Type", selection: $typeOf) {
                    ForEach(SortOrder.allCases) { typeOf in
                        Text(typeOf.rawValue.capitalized).tag(typeOf)
                    }
                }
                .buttonStyle(.bordered)
            }
            .padding(.horizontal)
            .padding(.top)

            VStack {
                JournalListView(filterString: typeOf.switchType)
            }
            .navigationTitle("My Job Journal")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("New Entry") {
                        showNewJournal.toggle()
                    }
                    .buttonStyle(.bordered)
                    .tint(.teal)
                }
            }
            .sheet(isPresented: $showNewJournal) {
                NavigationStack{
                    AddNewJournal()
                }
            }
        }
       
    }
}

#Preview {
    JournalHomeScreen()
}
