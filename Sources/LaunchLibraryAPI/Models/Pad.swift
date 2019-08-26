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
    public private(set) var latitude: Double?
    
    /// The longitude of the pad
    /// Available in modes: S, V
    public private(set) var longitude: Double?
    
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

extension Pad {
    /// Last updated date (in UTC)
    public var lastUpdatedDate: Date? {
        return changed?.date(format: "yyyy-MM-dd HH:mm:ss")
    }
}

extension Pad: Codable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try? values.decode(String.self, forKey: .name)
        padType = try? values.decode(PadType.self, forKey: .padType)
        mapURL = try? values.decode(String.self, forKey: .mapURL)
        retired = try? values.decode(Int.self, forKey: .retired)
        locationid = try? values.decode(Int.self, forKey: .locationid)
        agencies = try? values.decode([Agency].self, forKey: .agencies)
        wikiURL = try? values.decode(String.self, forKey: .wikiURL)
        infoURLs = try? values.decode([String].self, forKey: .infoURLs)
        changed = try? values.decode(String.self, forKey: .changed)
        
        // The latitude value type can be a double or string
        if let latitudeValue = try? values.decode(Double.self, forKey: .latitude) {
            latitude = latitudeValue
        }
        
        if let latitudeValue = try? values.decode(String.self, forKey: .latitude) {
            latitude = Double(latitudeValue)
        }
        
        // The longitude value type can be a double or string
        if let longitudeValue = try? values.decode(Double.self, forKey: .longitude) {
            longitude = longitudeValue
        }
        
        if let longitudeValue = try? values.decode(String.self, forKey: .longitude) {
            longitude = Double(longitudeValue)
        }
    }
}

extension Pad: CodableResponse {
    public static var arrayKey: String {
        return "pads"
    }
}
