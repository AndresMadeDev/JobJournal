//
//  CalenderHomerScreen.swift
//  JobJournal
//
//  Created by Andres Made on 1/1/24.
//

import SwiftUI
import SwiftData

struct CalenderHomerScreen: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \DayModel.date, order: .forward) var rating: [DayModel]
    @State private var showDate: Bool = false
    @State private var selectedMonth = 0
    @State private var selectedDate = Date()
    
    var dayOfWeeks = ["Mon","Tue","Wed","Thr","Fri","Sat","Sun",]
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "arrowshape.left.circle.fill")
                    }
                    .padding()
                    Spacer()
                    Text(selectedDate.monthAndYear)
                    Spacer()
                    Button {
                        selectedMonth += 1
                    } label: {
                        Image(systemName: "arrowshape.right.circle.fill")
                    }
                    .padding()
                    
                }
                .padding(.horizontal, 25)
                .font(.title)
                
                VStack(alignment: .center) {
                HStack {
                    ForEach(dayOfWeeks, id: \.self) { dayOfWeek in
                        Text(dayOfWeek)
                            .bold()
                            .foregroundStyle(.teal)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.vertical)
                .padding(.horizontal, 7)
                .background(.regularMaterial)
                .clipShape(.capsule)
                
                    
                
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 25) {
                        ForEach(rating) { day in
                            NavigationLink {
                                AddDayRatescreen(day: day)
                            } label: {
                                Text(day.date.formatted(.dateTime.day()))
                                    .bold()
                                    .frame(maxWidth: .infinity, minHeight: 40)
                                    .background(
                                        Circle()
                                            .foregroundStyle(day.dayAdded ? day.colorRating : .clear).opacity(0.7)
                                    )
                                    .tint(day.dayAdded ? .white : .primary)
                            }
                        }.frame(maxWidth: .infinity)
                    }
                }
                Spacer()
            }
            .padding()
        }
        .onAppear {
            if rating.isEmpty {
                createMonthDays(for: .now)
            }
        }
    }

    func createMonthDays(for dates: Date) {
        for dayOffset in 0..<dates.numberOfDaysInMonth {
            let newDay = DayModel()
            newDay.date = Calendar.current.date(byAdding: .day, value: dayOffset, to: dates.startOfMonth) ?? Date()
            context.insert(newDay)
        }
       
    }
    
}

#Preview {
    CalenderHomerScreen()
}
