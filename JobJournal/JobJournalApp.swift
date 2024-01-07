//
//  JobJournalApp.swift
//  JobJournal
//
//  Created by Andres Made on 12/25/23.
//

import SwiftUI
import SwiftData

@main
struct JobJournalApp: App {
    var body: some Scene {
        WindowGroup {
            HomeTabView()
        }
        .modelContainer(for: [JournalModel.self, DayModel.self])
    }
}
