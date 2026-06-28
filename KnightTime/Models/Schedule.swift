//
//  Schedule.swift
//  KnightTime
//
//  Created by Nihaal Manesia on 6/28/26.
//

import Foundation

struct Schedule: Decodable, Equatable {
    let name: String
    let dayOfTheWeek: Date.DayOfTheWeek?
    let periods: [Period]
}

extension Schedule {
    enum CodingKeys: String, CodingKey {
        case name = "scheduleName"
        case dayOfTheWeek = "dayOfWeek"
        case periods
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        
        let dayOfTheWeekString = try container.decode(String.self, forKey: .dayOfTheWeek)
        self.dayOfTheWeek = .init(rawValue: dayOfTheWeekString.lowercased())
        
        self.periods = try container.decode([Period].self, forKey: .periods)
    }
}
