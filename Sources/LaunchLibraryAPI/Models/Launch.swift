//
//  Launch.swift
//  
//
//  Created by Dustin Lange on 6/24/19.
//

import Foundation

public enum LaunchStatusType: Int, Codable {
    case Green = 1, Red, Success, Failed
}

public struct Launch {
    /// The launch identifier
    /// Available in modes: L, S, V
    public let id: Int
    
    /// Name of launch
    /// Available in modes: L, S, V
    public let name: String?
    
    /// The net date and time (formatted as Month, dd, yyyy hh24:mi:ss UTC)
    /// Available in modes: L, S, V
    public let net: String?
    
    /// TBD Date (If it's a 1, less than 100% confidence)
    /// Available in modes: L, S, V
    public let tbddate: Int?
    
    /// TBD Time (If it's a 1, less than 100% confidence)
    /// Available in modes: L, S, V
    public let tbdtime: Int?
    
    /// Launch Status (Green, Red, Success, Failed)
    /// Available in modes: S, V
    public let status: LaunchStatusType?
    
    /// Window Start (formatted as Month, dd, yyyy hh24:mi:ss UTC)
    /// Available in modes: S, V
    public let windowstart: String?
    
    /// Window End (formatted as Month, dd, yyyy hh24:mi:ss UTC)
    /// Available in modes: V
    public let windowend: String?
    
    /// Start time in ISO (formatted as yyyymmddThh24missZ)
    /// Available in modes: V
    public let isostart: String?
    
    /// End time in ISO (formatted as yyyymmddThh24missZ)
    /// Available in modes: V
    public let isoend: String?
    
    /// Net time in ISO (formatted as yyyymmddThh24missZ)
    /// Available in modes: V
    public let isonet: String?
    
    /// Window Start Timestamp (Unix timestamp)
    /// Available in modes: V
    public let wsstamp: Int?
    
    /// Window End Timestamp (Unix timestamp)
    /// Available in modes: V
    public let westamp: Int?
    
    /// NET Timestamp (Unix timestamp)
    /// Available in modes: V
    public let netstamp: Int?
    
    /// Collection of info URLs
    /// Available in modes: L, S, V
    public let infoURLs: [String]?
    
    /// Collection of video URLs
    /// Available in modes: L, S, V
    public let vidURLs: [String]?
    
    /// The reason for a hold
    /// Available in modes: V
    public let holdreason: String?
    
    /// The reason for failure
    /// Available in modes: V
    public let failreason: String?
    
    /// Probability (will be -1 if unknown)
    /// Available in modes: V
    public let probability: Int?
    
    /// Hastag for social media
    /// Available in modes: V
    public let hashtag: String?
    
    /// Launch location
    /// Available in modes: V
    public let location: Location?
    
    /// The Rocket used for the launch
    /// Available in modes: V
    public let rocket: Rocket?
    
    /// Collection of Missions
    /// Available in modes: V
    public let missions: [Mission]?
    
    /// The value type for the launch service provider
    /// Available in modes: V
    private let lsp: VariableValueType<Agency>?
    
    /// The date this resource last changed
    /// Available in modes: L, S, V
    public let changed: String?
}

extension Launch {
    /// Start Time (in UTC)
    public var startDateUTC: Date? {
        return isostart?.dateFromISO8601
    }
    
    /// End Time (in UTC)
    public var endDateUTC: Date? {
        return isoend?.dateFromISO8601
    }
    
    /// NET Time (in UTC)
    public var netDateUTC: Date? {
        return isonet?.dateFromISO8601
    }
    
    /// Window Start Time (in UTC)
    public var windowStartDateUTC: Date? {
        guard let startTimestamp = wsstamp else {
            return nil
        }
        
        return Date(timeIntervalSince1970: TimeInterval(startTimestamp))
    }
    
    /// Window End Time (in UTC)
    public var windowEndDateUTC: Date? {
        guard let endTimestamp = westamp else {
            return nil
        }
        
        return Date(timeIntervalSince1970: TimeInterval(endTimestamp))
    }
    
    /// Window NET Time (in UTC)
    public var windowNETDateUTC: Date? {
        guard let netTimestamp = netstamp else {
            return nil
        }
        
        return Date(timeIntervalSince1970: TimeInterval(netTimestamp))
    }
    
    /// Last updated date (in UTC)
    public var lastUpdatedDate: Date? {
        return changed?.date(format: "yyyy-MM-dd HH:mm:ss")
    }
    
    /// The launch service provider for the launch
    /// Available in modes: V
    public var lspAgency: Agency? {
        guard let lsp = lsp else {
            return nil
        }
        
        switch lsp {
        case .array(let value):
            return value.first
        default:
            return nil
        }
    }
}

extension Launch: Codable { }

extension Launch: CodableResponse {
    public static var arrayKey: String {
        return "launches"
    }
}
