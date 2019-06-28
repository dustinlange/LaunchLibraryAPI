//
//  File.swift
//  
//
//  Created by Dustin Lange on 6/24/19.
//

import Foundation
import XCTest
@testable import LaunchLibraryAPI

final class AgencyTests: XCTestCase {
    private func test_agency_endpoint(with params: [String: String]) {
        let expectation = self.expectation(description: "Agency")
        
        APIService.shared.GET(endpoint: .agency, params: params) { (result: Result<PaginatedResponse<Agency>, APIError>) in
            switch result {
            case let .success(response):
                XCTAssertEqual(1, response.total)
                XCTAssertEqual(1, response.count)
                XCTAssertEqual(0, response.offset)
                XCTAssertEqual(1, response.results.count)
            case .failure(let error):
                XCTFail("Request failed! \(error)")
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func test_agency_byID_list() {
        let params = ["id": "1", "mode": "list"]
        test_agency_endpoint(with: params)
    }
    
    func test_agency_byID_summary() {
        let params = ["id": "1", "mode": "summary"]
        test_agency_endpoint(with: params)
    }
    
    func test_agency_byID_verbose() {
        let params = ["id": "1", "mode": "verbose"]
        test_agency_endpoint(with: params)
    }
}
