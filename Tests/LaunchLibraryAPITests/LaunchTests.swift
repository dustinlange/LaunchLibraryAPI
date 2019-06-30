//
//  LaunchTests.swift
//  
//
//  Created by Dustin Lange on 6/24/19.
//

import Foundation
import XCTest
@testable import LaunchLibraryAPI

final class LaunchTests: XCTestCase {
    private func test_launch_endpoint(with params: [APIParameter: String]) {
        let expectation = self.expectation(description: "Launch")
        
        APIService.shared.GET(endpoint: .launch, params: params) { (result: Result<PaginatedResponse<Launch>, APIError>) in
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
    
    func test_launch_byID_list() {
        let params: [APIParameter: String] = [.id: "318", .mode: "list"]
        test_launch_endpoint(with: params)
    }
    
    func test_launch_byID_summary() {
        let params: [APIParameter: String] = [.id: "318", .mode: "summary"]
        test_launch_endpoint(with: params)
    }
    
    func test_launch_byID_verbose() {
        let params: [APIParameter: String] = [.id: "318", .mode: "verbose"]
        test_launch_endpoint(with: params)
    }
}
