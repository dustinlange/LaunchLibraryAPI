//
//  MissionType.swift
//  
//
//  Created by Dustin Lange on 6/25/19.
//

import Foundation

public struct MissionType {
    /// The identifier for the mission type
    /// Available in modes: L, S, V
    public let id: Int
    
    /// The name of the mission type
    /// Available in modes: L, S, V
    public let name: String?
    
    /// The description of the mission type
    /// Available in modes: V
    public let description: String?
    
    /// The date this resource last changed
    /// Available in modes: L, S, V
    public let changed: String?
}

extension MissionType: Codable { }

extension MissionType: CodableResponse {
    public static var arrayKey: String {
        return "types"
    }
}
