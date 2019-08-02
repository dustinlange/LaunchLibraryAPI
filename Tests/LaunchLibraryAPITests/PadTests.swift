//
//  PadTests.swift
//  
//
//  Created by Dustin Lange on 6/24/19.
//

import Foundation
import XCTest
@testable import LaunchLibraryAPI

final class PadTests: XCTestCase {
    private func test_pad_endpoint(with params: [APIParameter: String]) {
        let expectation = self.expectation(description: "Pad")
        
        let request = PaginatedRequest<Pad>(.pad, params)
        request.fetch() { result in
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
    
    func test_pad_byID_1_list() {
        let params: [APIParameter: String] = [.id: "1", .mode: "list"]
        test_pad_endpoint(with: params)
    }
    
    func test_pad_byID_1_summary() {
        let params: [APIParameter: String] = [.id: "1", .mode: "summary"]
        test_pad_endpoint(with: params)
    }
    
    func test_pad_byID_1_verbose() {
        let params: [APIParameter: String] = [.id: "1", .mode: "verbose"]
        test_pad_endpoint(with: params)
    }
}
