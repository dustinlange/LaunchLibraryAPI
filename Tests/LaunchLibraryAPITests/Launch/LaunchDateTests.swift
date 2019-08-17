//
//  LaunchDateTests.swift
//
//
//  Created by Dustin Lange on 7/30/19.
//

import Foundation
import XCTest
@testable import LaunchLibraryAPI

final class LaunchDateTests: LaunchTests {
    func test_launch_startDate_isEqual() {
        let date = Date.from(year: 2019, month: 7, day: 31, hour: 12, minute: 10, seconds: 46)
        XCTAssertEqual(launch?.startDateUTC, date)
    }
    
    func test_launch_startDate_isNotEqual() {
        let date = Date.from(year: 2019, month: 12, day: 31, hour: 12, minute: 10, seconds: 46)
        XCTAssertNotEqual(launch?.startDateUTC, date)
    }
    
    func test_launch_endDate_isEqual() {
        let date = Date.from(year: 2019, month: 7, day: 31, hour: 12, minute: 10, seconds: 46)
        XCTAssertEqual(launch?.endDateUTC, date)
    }
    
    func test_launch_endDate_isNotEqual() {
        let date = Date.from(year: 2018, month: 7, day: 31, hour: 12, minute: 10, seconds: 46)
        XCTAssertNotEqual(launch?.endDateUTC, date)
    }
    
    func test_launch_netDate_isEqual() {
        let date = Date.from(year: 2019, month: 7, day: 31, hour: 12, minute: 10, seconds: 46)
        XCTAssertEqual(launch?.netDateUTC, date)
    }
    
    func test_launch_netDate_isNotEqual() {
        let date = Date.from(year: 2019, month: 7, day: 29, hour: 12, minute: 10, seconds: 46)
        XCTAssertNotEqual(launch?.netDateUTC, date)
    }
    
    func test_launch_windowStartDate_isEqual() {
        let date = Date.from(year: 2019, month: 7, day: 31, hour: 12, minute: 10, seconds: 46)
        XCTAssertEqual(launch?.windowStartDateUTC, date)
    }
    
    func test_launch_windowStartDate_isNotEqual() {
        let date = Date.from(year: 2019, month: 7, day: 31, hour: 12, minute: 9, seconds: 46)
        XCTAssertNotEqual(launch?.windowStartDateUTC, date)
    }
    
    func test_launch_windowEndDate_isEqual() {
        let date = Date.from(year: 2019, month: 7, day: 31, hour: 12, minute: 10, seconds: 46)
        XCTAssertEqual(launch?.windowEndDateUTC, date)
    }
    
    func test_launch_windowEndDate_isNotEqual() {
        let date = Date.from(year: 2019, month: 7, day: 31, hour: 12, minute: 10, seconds: 45)
        XCTAssertNotEqual(launch?.windowEndDateUTC, date)
    }
    
    func test_launch_windowNETDate_isEqual() {
        let date = Date.from(year: 2019, month: 7, day: 31, hour: 12, minute: 10, seconds: 46)
        XCTAssertEqual(launch?.windowNETDateUTC, date)
    }
    
    func test_launch_windowNETDate_isNotEqual() {
        let date = Date.from(year: 2019, month: 7, day: 31, hour: 11, minute: 10, seconds: 46)
        XCTAssertNotEqual(launch?.windowNETDateUTC, date)
    }
    
    func test_launch_lastUpdatedDate_isEqual() {
        let date = Date.from(year: 2019, month: 7, day: 29, hour: 8, minute: 11, seconds: 40)
        XCTAssertEqual(launch?.lastUpdatedDate, date)
    }
    
    func test_launch_lastUpdatedDate_isNotEqual() {
        let date = Date.from(year: 2020, month: 8, day: 30, hour: 9, minute: 2, seconds: 33)
        XCTAssertNotEqual(launch?.lastUpdatedDate, date)
    }
}
