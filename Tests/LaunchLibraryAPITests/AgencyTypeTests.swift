//
//  AgencyTypeTests.swift
//  
//
//  Created by Dustin Lange on 6/25/19.
//

import Foundation
import XCTest
@testable import LaunchLibraryAPI

final class AgencyTypeTests: XCTestCase {
    private func test_agencyType_endpoint(with params: [APIParameter: String]) {
        let expectation = self.expectation(description: "AgencyType")
        
        let request = PaginatedRequest<AgencyType>(.agencyType, params)
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
    
    func test_agencyType_byID_1_list() {
        let params: [APIParameter: String] = [.id: "1", .mode: "list"]
        test_agencyType_endpoint(with: params)
    }
    
    func test_agencyType_byID_1_summary() {
        let params: [APIParameter: String] = [.id: "1", .mode: "summary"]
        test_agencyType_endpoint(with: params)
    }
    
    func test_agencyType_byID_1_verbose() {
        let params: [APIParameter: String] = [.id: "1", .mode: "verbose"]
        test_agencyType_endpoint(with: params)
    }
}
