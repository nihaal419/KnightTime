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
        calendar.timeZone = TimeZone(identifier: "America/Chicago")!
        let sunday = calendar.date(from: DateComponents(year: 2026, month: 6, day: 28))!
        
        #expect(sunday.dayOfTheWeek(calendar: calendar) == .sunday)
    }
    
    @Test func testScheduleGetRequest() throws {
        let request = GetScheduleRequest()
        let result = try request.perform(for: .sunday)
        #expect(result == .weekend)
    }
    
    @Test func testScheduleDecoding() async throws {
        let resourcesBundle = Bundle.main

        for dow in Date.DayOfTheWeek.allCases where dow.isWeekday {
            let url = try #require(resourcesBundle.url(forResource: dow.rawValue, withExtension: "json"))

            let data = try Data(contentsOf: url)
            let result = try JSONDecoder().decode(Schedule.self, from: data)
            #expect(result.periods.isEmpty == false)
            #expect(result.dayOfTheWeek == dow)
        }
    }
}
