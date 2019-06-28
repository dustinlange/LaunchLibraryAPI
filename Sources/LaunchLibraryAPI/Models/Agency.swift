//
//  Agency.swift
//  
//
//  Created by Dustin Lange on 6/12/19.
//

import Foundation

public struct Agency {
    /// Agency identifier
    /// Available in modes: L, S, V
    public let id: Int
    
    /// The name of the agency
    /// Available in modes: L, S, V
    public let name: String?
    
    /// The abbrevation for the agency
    /// Available in modes: L, S, V
    public let abbrev: String?
    
    /// Identifies the type of agency
    /// Available in modes: S, V
    public let type: Int?
    
    /// The country code the agency represents
    /// Available in modes: S, V
    public let countryCode: String?
    
    /// Wiki URL
    /// Available in modes: V
    public let wikiURL: String?
    
    /// Collection of information URLs
    /// Available in modes: V
    public let infoURLs: [String]?
    
    /// Identifies whether the agency is a Launch Service Provider
    /// 0 = No; 1 = Yes
    /// Available in modes: V
    public let islsp: Int?
    
    /// The date this resource last changed
    /// Available in modes: V
    public let changed: String?
}

extension Agency: Codable { }

extension Agency: CodableResponse {
    public static var arrayKey: String {
        return "agencies"
    }
}
