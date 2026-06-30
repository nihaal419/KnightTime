//
//  Period.swift
//  KnightTime
//
//  Created by Nihaal Manesia on 6/28/26.
//

import Foundation

struct Period: Decodable, Equatable, Identifiable {
    var id: String { name }
    let name: String
    let type: PeriodType
    let start: Date?
    let end: Date?
    let group: PeriodGroup?
}

extension Period {
    enum CodingKeys: String, CodingKey {
        case name, type, start, end, group
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(PeriodType.self, forKey: .type)
        self.group = try container.decodeIfPresent(PeriodGroup.self, forKey: .group)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.timeZone = .current
        
        let start = try container.decode(String.self, forKey: .start)
        let end = try container.decode(String.self, forKey: .end)
        
        self.start = formatter.date(from: start)
        self.end = formatter.date(from: end)
    }
}

enum PeriodType: String, Decodable, Equatable {
    case `class`
    case chapel
    case lunch
    case tutorial
    case advisory
}

enum PeriodGroup: String, Decodable, Equatable {
    case A
    case B
}
