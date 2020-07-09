//
//  Location.swift
//  
//
//  Created by Dustin Lange on 6/24/19.
//

import Foundation

public struct Location {
    /// Location identifier
    /// Available in modes: L, S, V
    public let id: Int
    
    /// The name of the location
    /// Available in modes: L, S, V
    public let name: String?
    
    /// The country code of the location
    /// Available in modes: L, S, V
    public let countryCode: String?
    
    /// The Wiki URL
    /// Available in modes: V
    public let wikiURL: String?
    
    /// Collection of information URLs
    /// Available in modes: V
    public let infoURLs: [String]?
    
    /// Collection of launch/landing pads
    /// Available in modes: V
    public let pads: [Pad]?
    
    /// The date this resource last changed
    /// Available in modes: V
    public let changed: String?
}

extension Location {
    /// Last updated date (in UTC)
    public var lastUpdatedDate: Date? {
        return changed?.date(format: "yyyy-MM-dd HH:mm:ss")
    }
}

extension Location: Codable { }

extension Location: CodableResponse {
    public static var arrayKey: String {
        return "locations"
    }
}

extension Location: Equatable {
    public static func ==(lhs: Location, rhs: Location) -> Bool {
        return lhs.id == rhs.id
    }
}
