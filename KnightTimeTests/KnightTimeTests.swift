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
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(identifier: "America/Chicago")!
        let sunday = calendar.date(from: DateComponents(year: 2026, month: 6, day: 28))!
        
        let request = GetScheduleRequest()
        let result = try request.perform(for: sunday)
        #expect(result == .weekend)
    }
    
    @Test func testScheduleDecoding() async throws {
        let tuple = Date.DayOfTheWeek.allCases.compactMap { dow in
            let filename = dow.rawValue
            return (dow, Bundle.main.url(forResource: filename, withExtension: "json"))
        }
        
        try await MainActor.run {
            for (dow, url) in tuple {
                guard [.sunday, .saturday].contains(dow) == false else { return }
                
                let data = try Data(contentsOf: url!)
                let result = try JSONDecoder().decode(Schedule.self, from: data)
                #expect(result.periods.isEmpty == false)
                #expect(result.dayOfTheWeek == dow)
            }
        }
    }
}
