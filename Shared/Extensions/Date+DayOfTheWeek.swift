//
//  Date+DayOfTheWeek.swift
//  KnightTime
//
//  Created by Nihaal Manesia on 6/28/26.
//

import Foundation

extension Date {
    func dayOfTheWeek(calendar: Calendar = .current) -> DayOfTheWeek? {
        // `.weekday` is 1-based starting at Sunday, matching DayOfTheWeek's declaration order.
        let weekday = calendar.component(.weekday, from: self)
        guard (1...7).contains(weekday) else { return nil }
        return DayOfTheWeek.allCases[weekday - 1]
    }

    enum DayOfTheWeek: String, CaseIterable, Identifiable {
        case sunday, monday, tuesday, wednesday, thursday, friday, saturday
        
        var id: String { rawValue }
        
        var isWeekday: Bool { Self.weekdays.contains(self) }
        
        static let weekdays: [DayOfTheWeek] = [
            .monday,
            .tuesday,
            .wednesday,
            .thursday,
            .friday
        ]
    }
}
