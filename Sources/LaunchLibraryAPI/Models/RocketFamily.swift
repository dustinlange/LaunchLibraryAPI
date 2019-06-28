//
//  RocketFamily.swift
//  
//
//  Created by Dustin Lange on 6/23/19.
//

import Foundation

public struct RocketFamily {
    /// Rocket Family identifier
    /// Available in modes: L, S, V
    public let id: Int
    
    /// The name of the rocket family
    /// Available in modes: L, S, V
    public let name: String?
    
    /// Collection of agencies
    /// Available in modes: V
    public let agencies: [Agency]?
    
    /// The date this resource last changed
    /// Available in modes: L, S, V
    public let changed: String?
}

extension RocketFamily: Codable { }

extension RocketFamily: CodableResponse {
    public static var arrayKey: String {
        return "RocketFamilies"
    }
}
