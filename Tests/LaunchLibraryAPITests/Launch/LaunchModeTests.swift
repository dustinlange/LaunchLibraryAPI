//
//  LaunchModeTests.swift
//  
//
//  Created by Dustin Lange on 6/24/19.
//

import Foundation
import XCTest
@testable import LaunchLibraryAPI

final class LaunchModeTests: XCTestCase {
    private func test_launch_endpoint(with params: [APIParameter: String]) {
        let expectation = self.expectation(description: "Launch")
        
        let request = PaginatedRequest<Launch>(.launch, params)
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
    
    func test_launch_byID_318_list() {
        let params: [APIParameter: String] = [.id: "318", .mode: "list"]
        test_launch_endpoint(with: params)
    }
    
    func test_launch_byID_318_summary() {
        let params: [APIParameter: String] = [.id: "318", .mode: "summary"]
        test_launch_endpoint(with: params)
    }
    
    func test_launch_byID_318_verbose() {
        let params: [APIParameter: String] = [.id: "318", .mode: "verbose"]
        test_launch_endpoint(with: params)
    }
    
    func test_launch_byID_1663_verbose() {
        let params: [APIParameter: String] = [.id: "1663", .mode: "verbose"]
        test_launch_endpoint(with: params)
    }
}
