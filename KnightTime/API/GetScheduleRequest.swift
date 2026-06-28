//
//  GetScheduleRequest.swift
//  KnightTime
//
//  Created by Nihaal Manesia on 6/28/26.
//

import Foundation

struct GetScheduleRequest {
    enum Result: Equatable {
        case weekend
        case weekday(schedule: Schedule)
        
        static func == (lhs: Self, rhs: Self) -> Bool {
            switch (lhs, rhs) {
            case (.weekend, .weekend):
                return true
            case (.weekday(let lhsSchedule), .weekday(let rhsSchedule)):
                return lhsSchedule == rhsSchedule
            default:
                return false
            }
        }
    }
    
    func perform(for day: Date = Date()) throws -> Result {
        guard let today = day.dayOfTheWeek() else {
            throw APIError.badRequest
        }
        
        var filename: String
        
        switch today {
        case .sunday, .saturday:
            return .weekend
        default:
            filename = today.rawValue
        }
        
        guard let fileUrl = Bundle.main.url(forResource: filename, withExtension: "json") else {
            throw APIError.noData
        }
        let data = try Data(contentsOf: fileUrl)
        let schedule = try JSONDecoder().decode(Schedule.self, from: data)
        
        return .weekday(schedule: schedule)
    }
}
