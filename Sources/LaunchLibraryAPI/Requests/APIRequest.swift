//
//  APIRequest.swift
//  
//
//  Created by Dustin Lange on 7/31/19.
//

import Foundation

public protocol APIRequestProtocol {
    associatedtype T
    
    var apiService: APIService { get set }
    var endPoint: EndPoint { get set }
    var params: [APIParameter: String] { get set }
    
    func fetch(_ completion: @escaping (Result<T, APIError>) -> ())
}

public class APIRequest<T: Codable>: APIRequestProtocol {
    public var apiService: APIService
    public var endPoint: EndPoint
    public var params: [APIParameter: String]
    
    public init(_ endPoint: EndPoint, _ params: [APIParameter: String], _ apiService: APIService = .shared) {
        self.apiService = apiService
        self.endPoint = endPoint
        self.params = params
    }
    
    public func fetch(_ completion: @escaping (Result<T, APIError>) -> ()) {
        apiService.GET(endpoint: endPoint, params: params) { (result: Result<T, APIError>) in
            completion(result)
        }
    }
}
