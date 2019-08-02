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
    
    /// The value type for agencies
    /// Available in modes: V
    private let agencyValue: VariableValueType<Agency>?
    
    /// The date this resource last changed
    /// Available in modes: L, S, V
    public let changed: String?
}

extension RocketFamily {
    /// Last updated date (in UTC)
    public var lastUpdatedDate: Date? {
        return changed?.date(format: "yyyy-MM-dd HH:mm:ss")
    }
    
    /// Collection of agencies; Available through the RocketFamily endpoint
    /// Available in modes: V
    public var agencies: [Agency]? {
        guard let agencyValue = agencyValue else {
            return nil
        }
        
        switch agencyValue {
        case .array(let values):
            return values
        default:
            return nil
        }
    }
    
    /// Collection of agency IDs; Available through the Rocket endpoint
    /// Available in modes: V
    public var agencyIds: [String]? {
        guard let agencyValue = agencyValue else {
            return nil
        }
        
        switch agencyValue {
        case .id(let value):
            return value.components(separatedBy: ",")
        default:
            return nil
        }
    }
}

extension RocketFamily: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case agencyValue = "agencies"
        case changed
    }
}

extension RocketFamily: CodableResponse {
    public static var arrayKey: String {
        return "RocketFamilies"
    }
}
