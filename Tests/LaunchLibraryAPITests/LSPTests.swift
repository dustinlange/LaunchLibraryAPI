//
//  LSPTests.swift
//  
//
//  Created by Dustin Lange on 6/25/19.
//

import Foundation
import XCTest
@testable import LaunchLibraryAPI

final class LSPTests: XCTestCase {
    private func test_lsp_endpoint(with params: [APIParameter: String]) {
        let expectation = self.expectation(description: "LSP")
        
        let request = PaginatedRequest<Agency>(.lsp, params)
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
    
    func test_lsp_byID_82_list() {
        let params: [APIParameter: String] = [.id: "82", .mode: "list"]
        test_lsp_endpoint(with: params)
    }
    
    func test_lsp_byID_82_summary() {
        let params: [APIParameter: String] = [.id: "82", .mode: "summary"]
        test_lsp_endpoint(with: params)
    }
    
    func test_lsp_byID_82_verbose() {
        let params: [APIParameter: String] = [.id: "82", .mode: "verbose"]
        test_lsp_endpoint(with: params)
    }
}
