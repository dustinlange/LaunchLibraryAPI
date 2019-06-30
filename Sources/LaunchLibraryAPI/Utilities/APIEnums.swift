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

public enum APIParameter: String {
    case mode = "mode"
    case next = "next"
    case agency = "agency"
    case startdate = "startdate"
    case enddate = "enddate"
    case limit = "limit"
    case total = "total"
    case count = "count"
    case offset = "offset"
    case tbdtime = "tbdtime"
    case tbddate = "tbddate"
    case id = "id"
    case changed = "changed"
    case locationid = "locationid"
}

public protocol CodableResponse {
    static var arrayKey: String { get }
}
