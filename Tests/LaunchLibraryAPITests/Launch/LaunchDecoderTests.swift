//
//  LaunchDecoderTests.swift
//  LaunchLibraryAPI
//
//  Created by Dustin Lange on 1/23/20.
//

import XCTest
@testable import LaunchLibraryAPI

class LaunchDecoderTests: XCTestCase {
    func test_launches_next30_decoded() {
        let expectation = self.expectation(description: "Launch")
        
        let expectedCount = 30
        let request = PaginatedRequest<Launch>(.launch, [.mode: "verbose", .next: "\(expectedCount)"])
        request.fetch() { result in
            switch result {
            case let .success(response):
                XCTAssertGreaterThan(response.total ?? 0, 0)
                XCTAssertEqual(expectedCount, response.count)
                XCTAssertEqual(0, response.offset)
                XCTAssertEqual(expectedCount, response.results.count)
                
            case .failure(let error):
                XCTFail("Something went wrong! \(error)")
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
}
