//
//  String+Date.swift
//  
//
//  Created by Dustin Lange on 7/30/19.
//

import Foundation

public extension String {
    var dateFromISO8601: Date? {
        return Formatter.iso8601.date(from: self)
    }
    
    func date(format: String, timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = timeZone
        
        return formatter.date(from: self)
    }
}
