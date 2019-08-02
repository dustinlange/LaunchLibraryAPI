//
//  PaginatedResponse.swift
//  
//
//  Created by Dustin Lange on 6/23/19.
//

import Foundation

public struct PaginatedResponse<T: Codable & CodableResponse>: Codable {
    public let total: Int?
    public let count: Int?
    public var offset: Int?
    public var results: [T]
    
    private enum CodingKeys: String, CodingKey {
        case total, count, offset
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total = try values.decode(Int.self, forKey: .total)
        count = try values.decode(Int.self, forKey: .count)
        
        // It's possible for the offset value to be returned as an Int or String. I've
        // reported this inconsistency to LaunchLibrary.
        
        // Attempt to decode as an Int
        if let offsetInt = try? values.decode(Int.self, forKey: .offset) {
            offset = offsetInt
        }
        
        // Attempt to decode as a String
        if let offsetString = try? values.decode(String.self, forKey: .offset) {
            offset = Int(offsetString)
        }
        
        let genericValues = try decoder.container(keyedBy: GenericCodingKeys.self)
        results = try genericValues.decode([T].self, forKey: GenericCodingKeys(stringValue: T.arrayKey)!)
    }
}

private struct GenericCodingKeys: CodingKey {
    var stringValue: String
    var intValue: Int?
    
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    init?(intValue: Int) {
        self.intValue = intValue
        self.stringValue = "\(intValue)"
    }
}
