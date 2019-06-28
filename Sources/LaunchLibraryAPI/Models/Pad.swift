//
//  Pad.swift
//  
//
//  Created by Dustin Lange on 6/23/19.
//

import Foundation

public enum PadType: Int, Codable {
    case Launch, Landing
}

public struct Pad {
    /// Pad identifier
    /// Available in modes: L, S, V
    public let id: Int
    
    /// The name of the pad
    /// Available in modes: L, S, V
    public let name: String?
    
    /// The type of pad
    /// Available in modes: S, V
    public let padType: PadType?
    
    /// The latitude of the pad
    /// Available in modes: S, V
    public let latitude: String?
    
    /// The longitude of the pad
    /// Available in modes: S, V
    public let longitude: String?
    
    /// The URL of the pad on a map
    /// Available in modes: V
    public let mapURL: String?
    
    /// Identifies whether the pad is active or not
    /// Available in mode: V
    public let retired: Int?
    
    /// The identifier for the location
    /// Available in mode: V
    public let locationid: Int?
    
    /// Collection of agencies associated with the pad
    /// Available in modes: V
    public let agencies: [Agency]?
    
    /// The Wiki URL
    /// Available in modes: V
    public let wikiURL: String?
    
    /// Collection of information URLs
    /// Available in modes: V
    public let infoURLs: [String]?
    
    /// The date this resource last changed
    /// Available in modes: V
    public let changed: String?
}

extension Pad: Codable { }

extension Pad: CodableResponse {
    public static var arrayKey: String {
        return "pads"
    }
}
