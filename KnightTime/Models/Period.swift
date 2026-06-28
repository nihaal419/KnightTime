//
//  Period.swift
//  KnightTime
//
//  Created by Nihaal Manesia on 6/28/26.
//

import Foundation

struct Period: Decodable, Equatable {
    let name: String
    let type: PeriodType
    let start: Date
    let end: Date
    let group: PeriodGroup
}

enum PeriodType: String, Decodable, Equatable {
    case `class`
    case chapel
    case lunch
    case tutorial
}

enum PeriodGroup: String, Decodable, Equatable {
    case A
    case B
}
