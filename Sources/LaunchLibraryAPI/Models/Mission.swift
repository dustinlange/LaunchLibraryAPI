//
//  Mission.swift
//  
//
//  Created by Dustin Lange on 6/24/19.
//

import Foundation

public struct Mission {
    /// Identifier of the mission
    /// Available in modes: L, S, V
    public let id: Int
    
    /// Identifies the type of mission
    /// Available in modes: V
    public let type: Int?
    
    /// The name of the type of mission
    /// Available in modes: V
    public let typeName: String?
    
    /// The name of the mission
    /// Available in modes: L, S, V
    public let name: String?
    
    /// Details describing the mission
    /// Available in modes: S, V
    public let description: String?
    
    /// Collection of agencies involved in the mission
    /// Available in modes: V
    public let agencies: [Agency]?
    
    /// Collection of payloads delivered by the mission
    /// Available in modes: V
    public let payloads: [Payload]?
}

extension Mission: Codable { }

extension Mission: CodableResponse {
    public static var arrayKey: String {
        return "missions"
    }
}
