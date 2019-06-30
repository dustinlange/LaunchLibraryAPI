//
//  RocketFamilyTests.swift
//  
//
//  Created by Dustin Lange on 6/25/19.
//

import Foundation
import XCTest
@testable import LaunchLibraryAPI

final class RocketFamilyTests: XCTestCase {
    private func test_rocketFamily_endpoint(with params: [APIParameter: String]) {
        let expectation = self.expectation(description: "RocketFamily")
        
        APIService.shared.GET(endpoint: .rocketFamily, params: params) { (result: Result<PaginatedResponse<RocketFamily>, APIError>) in
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
    
    func test_rocketFamily_byID_list() {
        let params: [APIParameter: String] = [.id: "1", .mode: "list"]
        test_rocketFamily_endpoint(with: params)
    }
    
    func test_rocketFamily_byID_summary() {
        let params: [APIParameter: String] = [.id: "1", .mode: "summary"]
        test_rocketFamily_endpoint(with: params)
    }
    
    func test_rocketFamily_byID_verbose() {
        let params: [APIParameter: String] = [.id: "1", .mode: "verbose"]
        test_rocketFamily_endpoint(with: params)
    }
}
