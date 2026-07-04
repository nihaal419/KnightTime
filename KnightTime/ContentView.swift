//
//  ContentView.swift
//  KnightTime
//
//  Created by Nihaal Manesia on 6/26/26.
//

import SwiftUI

@Observable
class ScheduleViewModel {
    var selectedSchedule: Schedule?
    var isWeekend: Bool?
    var isLoading: Bool = false
    
    private func reset() {
        selectedSchedule = nil
        isWeekend = nil
    }
    
    @MainActor
    func fetchSchedule(for day: Date.DayOfTheWeek) async {
        isLoading = true
        defer { isLoading = false }

        reset()

        do {
            let result = try await Task.detached(priority: .userInitiated) {
                try await GetScheduleRequest().perform(for: day)
            }.value

            switch result {
            case .weekend:
                isWeekend = true
            case .weekday(let schedule):
                isWeekend = false
                selectedSchedule = schedule
            }
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}

struct ContentView: View {
    @State private var selectedDay: Date.DayOfTheWeek?
    @State private var viewModel = ScheduleViewModel()
    
    var body: some View {
        NavigationSplitView {
            List(Date.DayOfTheWeek.weekdays, selection: $selectedDay) {
                Text($0.rawValue.capitalized).tag($0)
            }
            .navigationTitle("Schedules")
        } detail: {
            Group {
                if selectedDay == nil {
                    Text("Make a selection to view a schedule.")
                } else {
                    if viewModel.isLoading {
                        Text("Loading schedule...")
                    } else if let schedule = viewModel.selectedSchedule {
                        VStack {
                            ForEach(schedule.periods) { period in
                                Text(period.name)
                            }
                        }
                    }
                }
            }
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    if let today = Date().dayOfTheWeek() {
                        let isWeekday = Date.DayOfTheWeek.weekdays.contains(today)
                        
                        Button {
                            selectedDay = today
                        } label: {
                            if isWeekday {
                                Text("Today is \(today.rawValue.capitalized)")
                            } else {
                                Text("Enjoy the weekend!")
                                    .foregroundStyle(.primary)
                            }
                        }
                        .disabled(isWeekday == false)
                    }
                }
            }
            .onAppear {
                // Set today as selected day
                if let today = Date().dayOfTheWeek(),
                   today.isWeekday {
                    selectedDay = today
                }
            }
            .onChange(of: selectedDay) { _, day in
                guard let day else { return }
                Task { await viewModel.fetchSchedule(for: day) }
            }
        }
    }
}

#Preview {
    ContentView()
}
