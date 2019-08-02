//
//  LaunchStatus.swift
//  
//
//  Created by Dustin Lange on 6/25/19.
//

import Foundation

public struct LaunchStatus {
    /// The identifier for the launch status
    /// Available in modes: L, S, V
    public let id: Int
    
    /// The name of the launch status
    /// Available in modes: L, S, V
    public let name: String?
    
    /// The description of the launch status
    /// Available in modes: V
    public let description: String?
    
    /// The date this resource last changed
    /// Available in modes: L, S, V
    public let changed: String?
}

extension LaunchStatus {
    /// Last updated date (in UTC)
    public var lastUpdatedDate: Date? {
        return changed?.date(format: "yyyy-MM-dd HH:mm:ss")
    }
}

extension LaunchStatus: Codable { }

extension LaunchStatus: CodableResponse {
    public static var arrayKey: String {
        return "types"
    }
}
