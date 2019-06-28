//
//  LaunchStatusTests.swift
//  
//
//  Created by Dustin Lange on 6/25/19.
//

import Foundation
import XCTest
@testable import LaunchLibraryAPI

final class LaunchStatusTests: XCTestCase {
    private func test_launchStatus_endpoint(with params: [String: String]) {
        let expectation = self.expectation(description: "LaunchStatus")
        
        APIService.shared.GET(endpoint: .launchStatus, params: params) { (result: Result<PaginatedResponse<LaunchStatus>, APIError>) in
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
    
    func test_launchStatus_byID_list() {
        let params = ["id": "1", "mode": "list"]
        test_launchStatus_endpoint(with: params)
    }
    
    func test_launchStatus_byID_summary() {
        let params = ["id": "1", "mode": "summary"]
        test_launchStatus_endpoint(with: params)
    }
    
    func test_launchStatus_byID_verbose() {
        let params = ["id": "1", "mode": "verbose"]
        test_launchStatus_endpoint(with: params)
    }
}
