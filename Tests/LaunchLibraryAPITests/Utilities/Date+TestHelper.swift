//
//  Date+TestHelper.swift
//  LaunchLibraryAPI
//
//  Created by Dustin Lange on 8/16/19.
//

import Foundation

extension Date {
    static func from(year: Int, month: Int, day: Int, hour: Int, minute: Int, seconds: Int) -> Date? {
        var calendar = Calendar(identifier: .iso8601)
        calendar.locale = Locale(identifier: "en_US_POSIX")
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = seconds
        
        return calendar.date(from: dateComponents) ?? nil
    }
}
