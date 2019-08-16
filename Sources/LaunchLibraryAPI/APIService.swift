//
//  APIService.swift
//  
//
//  Created by Dustin Lange on 6/16/19.
//

import Foundation

public struct APIService {
    private let baseUrl = URL(string: "https://launchlibrary.net/1.4.1")!
    
    public static let shared = APIService()
    private let decoder = JSONDecoder()
    
    public func GET<T: Codable>(endpoint: EndPoint,
                                params: [APIParameter: String]?,
                                completion: @escaping (Result<T, APIError>) -> Void) {
        let url = baseUrl.appendingPathComponent(endpoint.path())
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = []
        
        if let params = params {
            for (_, value) in params.enumerated() {
                let queryItem = URLQueryItem(name: value.key.rawValue, value: value.value)
                urlComponents.queryItems?.append(queryItem)
            }
        }
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(.networkError(error: error!)))
                }
                
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(.noResponse))
                }
                
                return
            }
            
            do {
                let result = try self.decoder.decode(T.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } catch let error {
                completion(.failure(.jsonDecodingError(error: error)))
            }
        }
        
        task.resume()
    }
}
