//
//  APIEnums.swift
//  
//
//  Created by Dustin Lange on 6/12/19.
//

import Foundation

public enum EndPoint {
    case launch
    case launchStatus
    case agency
    case agencyType
    case rocket
    case rocketFamily
    case pad
    case location
    case mission
    case missionType
    case lsp
    
    func path() -> String {
        switch self {
        case .launch:
            return "launch"
        case .launchStatus:
            return "launchstatus"
        case .agency:
            return "agency"
        case .agencyType:
            return "agencytype"
        case .rocket:
            return "rocket"
        case .rocketFamily:
            return "rocketfamily"
        case .pad:
            return "pad"
        case .location:
            return "location"
        case .mission:
            return "mission"
        case .missionType:
            return "missiontype"
        case .lsp:
            return "lsp"
        }
    }
}

public enum APIError: Error {
    case noResponse
    case jsonDecodingError(error: Error)
    case networkError(error: Error)
}

enum RequestMode: String {
    case verbose = "verbose"
    case list = "list"
    case summary = "summary"
}

public protocol CodableResponse {
    static var arrayKey: String { get }
}
