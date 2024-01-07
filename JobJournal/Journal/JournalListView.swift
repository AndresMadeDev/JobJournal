//
//  JournalList.swift
//  JobJournal
//
//  Created by Andres Made on 12/25/23.
//

import SwiftUI
import SwiftData
import Algorithms

struct JournalListView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \JournalModel.dateAdded, order: .forward) private var journals: [JournalModel]
    @State private var showError: Bool = false
    
    
    var journalChunck:[[JournalModel]] {
        let journalChunck = journals.chunked { Date.calender.isDate($0.dateAdded, equalTo: $1.dateAdded, toGranularity: .month) }
        return journalChunck.map {Array($0)}
    }
    
    init(filterString: String) {
        let sort = [SortDescriptor(\JournalModel.dateAdded, order: .reverse),
                    SortDescriptor(\JournalModel.type),
        ]
        let predicate = #Predicate<JournalModel> { journal in
            journal.type.localizedStandardContains(filterString)
            || filterString.isEmpty
        }
        _journals = Query(filter: predicate, sort: sort)
    }
    
    var body: some View {
        Group {
            if journals.isEmpty {
                ContentUnavailableView("Enter your journal book.", systemImage: "book.fill")
            } else {
                List {
                    ForEach(journalChunck, id: \.self) { journals in
                        Section {
                            ForEach(journals) { journal in
                                NavigationLink {
                                    EditJournalScreen(journal: journal)
                                } label: {
                                    JournalCellView(journal: journal)
                                }
                            }
                        } header: {
                            Text(journals.first!.dateAdded.journalMonth)
                                .font(.headline)
                                .bold()
                        }

                            
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            let journal = journals[index]
                            context.delete(journal)
                        }
                    }

                }
            }
        }
    }
}


