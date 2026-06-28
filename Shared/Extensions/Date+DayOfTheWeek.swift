//
//  Date+DayOfTheWeek.swift
//  KnightTime
//
//  Created by Nihaal Manesia on 6/28/26.
//

import Foundation

extension Date {
    func dayOfTheWeek() -> DayOfTheWeek? {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        let dayOfTheWeek = formatter.string(from: self)
        return DayOfTheWeek(rawValue: dayOfTheWeek)
    }
    
    enum DayOfTheWeek: String, CaseIterable {
        case Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
    }
}
