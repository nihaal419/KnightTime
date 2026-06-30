//
//  ContentView.swift
//  KnightTime
//
//  Created by Nihaal Manesia on 6/26/26.
//

import SwiftUI

struct ContentView: View {
    @State private var schedule: Schedule?
    @State private var isWeekend: Bool = false
    @State private var isLoading: Bool = true
    
    var body: some View {
        NavigationStack {
            VStack {
                if isLoading {
                    Text("Loading...")
                } else if isWeekend {
                    Text("It's a weekend")
                } else if let schedule {
                    ForEach(schedule.periods) { period in
                        Text(period.name)
                    }
                } else {
                    Text("I don't know how you got here, you must be a hacker.")
                }
            }
            .onAppear {
                Task { @MainActor in
                    do {
                        let request = GetScheduleRequest()
                        let result = try request.perform()
                        
                        switch result {
                        case .weekend:
                            self.isWeekend = true
                        case .weekday(let schedule):
                            self.schedule = schedule
                        }
                        
                        isLoading = false
                    } catch {
                        debugPrint(error.localizedDescription)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
