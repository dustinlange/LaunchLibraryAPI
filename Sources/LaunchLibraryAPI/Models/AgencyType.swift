//
//  AgencyType.swift
//  
//
//  Created by Dustin Lange on 6/25/19.
//

import Foundation

public struct AgencyType {
    /// The identifier for the agency type
    /// Available in modes: L, S, V
    public let id: Int
    
    /// The name of the agency type
    /// Available in modes: L, S, V
    public let name: String?
    
    /// The description of the agency type
    /// Available in modes: V
    public let description: String?
    
    /// The date this resource last changed
    /// Available in modes: L, S, V
    public let changed: String?
}

extension AgencyType {
    /// Last updated date (in UTC)
    public var lastUpdatedDate: Date? {
        return changed?.date(format: "yyyy-MM-dd HH:mm:ss")
    }
}

extension AgencyType: Codable { }

extension AgencyType: CodableResponse {
    public static var arrayKey: String {
        return "types"
    }
}
