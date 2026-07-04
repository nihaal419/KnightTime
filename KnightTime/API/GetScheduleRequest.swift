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
    }
    
    func perform(for dayOfTheWeek: Date.DayOfTheWeek? = Date().dayOfTheWeek()) throws -> Result {
        guard let today = dayOfTheWeek else {
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
