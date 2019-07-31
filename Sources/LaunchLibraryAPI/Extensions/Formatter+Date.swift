//
//  Formatter+Date.swift
//  
//
//  Created by Dustin Lange on 7/30/19.
//

import Foundation

public extension Formatter {
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyyMMdd'T'HHmmssZ"
        
        return formatter
    }()
}
