//
//  AgencyValueType.swift
//  
//
//  Created by Dustin Lange on 7/12/19.
//

import Foundation

public enum VariableValueType<T: Codable>: Codable {
    case id(String)
    case array([T])
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .id(value)
            return
        }
        
        if let value = try? container.decode(T.self) {
            self = .array([value])
            return
        }
        
        if let value = try? container.decode([T].self) {
            self = .array(value)
            return
        }
        
        throw DecodingError.typeMismatch(VariableValueType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for VariableValueType"))
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .id(let value):
            try container.encode(value)
        case .array(let value):
            try container.encode(value)
        }
    }
}
