//
//  PaginatedRequest.swift
//  
//
//  Created by Dustin Lange on 7/31/19.
//

import Foundation

public class PaginatedRequest<T: Codable & CodableResponse>: APIRequest<PaginatedResponse<T>> {
    private var response: PaginatedResponse<T>?
    
    /// Returns the current page number
    public var pageNumber: Int {
        guard let offset = response?.offset, let count = response?.count else {
            return 0
        }
        
        return offset / count
    }
    
    /// Identifies whether there are more pages to load
    public var hasMorePages: Bool {
        guard let total = response?.total, let count = response?.count else {
            return false
        }
        
        let maxNumOfPages = Int(floor(Double(total / count))) - 1
        return pageNumber < maxNumOfPages
    }
    
    /// Fetch the initial page of results
    public override func fetch(_ completion: @escaping (Result<PaginatedResponse<T>, APIError>) -> ()) {
        fetch(atPage: 0) { result in
            completion(result)
        }
    }
    
    /// Fetch the next page of results
    public func fetchNextPage(_ completion: @escaping (Result<PaginatedResponse<T>, APIError>) -> ()) {
        let nextPage = pageNumber + 1
        fetch(atPage: nextPage) { result in
            completion(result)
        }
    }
    
    /// Fetch the results for a given page
    public func fetch(atPage: Int, _ completion: @escaping (Result<PaginatedResponse<T>, APIError>) -> ()) {
        let offset = ((response?.count ?? 0) * atPage)
        params[.offset] = "\(offset)"
        
        super.fetch() { [weak self] (result: Result<PaginatedResponse<T>, APIError>) in
            guard let strongSelf = self else { return }
            
            switch result {
            case .success(let response):
                strongSelf.response = response
            default:
                break
            }
            
            completion(result)
        }
    }
}
