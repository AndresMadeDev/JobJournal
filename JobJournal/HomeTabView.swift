//
//  HomeTabView.swift
//  JobJournal
//
//  Created by Andres Made on 1/1/24.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        TabView {
            JournalHomeScreen()
                .tabItem {
                    Label("Journal", systemImage: "book.pages.fill")
                }
            CalenderHomerScreen()
                .tabItem {
                    Label("Journal", systemImage: "calendar")
                }
        }
    }
}

#Preview {
    HomeTabView()
}
