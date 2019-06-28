//
//  Payload.swift
//  
//
//  Created by Dustin Lange on 6/25/19.
//

import Foundation

public struct Payload {
    /// The payload identifier
    /// Available in modes: L, S, V
    public let id: Int
    
    /// The name of the payload
    /// Available in modes: L, S, V
    public let name: String?
    
    /// Comma delimited string of country codes
    /// Available in modes: L, S, V
    public let countrycodes: String?
    
    /// Description of the payload
    /// Available in modes: L, S, V
    public let description: String?
    
    /// The type of payload
    /// Available in modes: L, S, V
    public let type: Int?
    
    /// The dimensions of the payload (in meters)
    /// Available in modes: L, S, V
    public let dimensions: String?
    
    /// The weight of the payload (in kg)
    /// Available in modes: L, S, V
    public let weight: String?
    
    /// The total number of objects in the payload
    /// Available in modes: L, S, V
    public let total: Int?
    
    /// Collection of agencies
    /// Available in modes: L, S, V
    public let agencies: [Agency]?
    
    /// The date this resource last changed
    /// Available in modes: V
    public let changed: String?
}

extension Payload: Codable { }
