//
//  MissionTests.swift
//  
//
//  Created by Dustin Lange on 6/24/19.
//

import Foundation
import XCTest
@testable import LaunchLibraryAPI

final class MissionTests: XCTestCase {
    private func test_mission_endpoint(with params: [String: String]) {
        let expectation = self.expectation(description: "Mission")
        
        APIService.shared.GET(endpoint: .mission, params: params) { (result: Result<PaginatedResponse<Mission>, APIError>) in
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
    
    func test_mission_byID_list() {
        let params = ["id": "785", "mode": "list"]
        test_mission_endpoint(with: params)
    }
    
    func test_mission_byID_summary() {
        let params = ["id": "785", "mode": "summary"]
        test_mission_endpoint(with: params)
    }
    
    func test_mission_byID_verbose() {
        let params = ["id": "785", "mode": "verbose"]
        test_mission_endpoint(with: params)
    }
}
