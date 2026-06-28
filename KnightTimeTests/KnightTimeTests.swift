//
//  KnightTimeTests.swift
//  KnightTimeTests
//
//  Created by Nihaal Manesia on 6/26/26.
//

import Testing
import Foundation
@testable import KnightTime

struct KnightTimeTests {
    @Test func testDayOfTheWeek() async throws {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(identifier: "CST")!
        let sunday = calendar.date(from: DateComponents(year: 2026, month: 6, day: 28))!
        
        #expect(sunday.dayOfTheWeek() == .Sunday)
    }
    
    @Test func testScheduleGetRequest() throws {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(identifier: "CST")!
        let sunday = calendar.date(from: DateComponents(year: 2026, month: 6, day: 28))!
        
        let request = GetScheduleRequest()
        let result = try request.perform(for: sunday)
        #expect(result == .weekend)
    }
}
