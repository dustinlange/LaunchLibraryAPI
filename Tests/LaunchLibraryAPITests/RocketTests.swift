//
//  RocketTests.swift
//  
//
//  Created by Dustin Lange on 6/24/19.
//

import Foundation
import XCTest
@testable import LaunchLibraryAPI

final class RocketTests: XCTestCase {
    private func test_rocket_endpoint(with params: [APIParameter: String]) {
        let expectation = self.expectation(description: "Rocket")
        
        let request = PaginatedRequest<Rocket>(.rocket, params)
        request.fetch() { result in
            XCTAssertFalse(request.hasMorePages)
            
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
    
    func test_rocket_byID_1_list() {
        let params: [APIParameter: String] = [.id: "1", .mode: "list"]
        test_rocket_endpoint(with: params)
    }
    
    func test_rocket_byID_1_summary() {
        let params: [APIParameter: String] = [.id: "1", .mode: "summary"]
        test_rocket_endpoint(with: params)
    }
    
    func test_rocket_byID_1_verbose() {
        let params: [APIParameter: String] = [.id: "1", .mode: "verbose"]
        test_rocket_endpoint(with: params)
    }
}
