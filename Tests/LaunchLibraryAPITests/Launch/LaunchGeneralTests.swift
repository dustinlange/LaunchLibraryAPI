//
//  LaunchGeneralTests.swift
//  LaunchLibraryAPITests
//
//  Created by Dustin Lange on 8/16/19.
//

import XCTest
@testable import LaunchLibraryAPI

class LaunchGeneralTests: LaunchTests {
    func test_lspAgency_isEqual() {
        XCTAssertEqual(launch?.lspAgency?.id, 96)
        XCTAssertEqual(launch?.lspAgency?.name, "Khrunichev State Research and Production Space Center")
        XCTAssertEqual(launch?.lspAgency?.abbrev, "KhSC")
        XCTAssertEqual(launch?.lspAgency?.countryCode, "RUS")
        XCTAssertEqual(launch?.lspAgency?.type, 1)
        XCTAssertEqual(launch?.lspAgency?.infoURLs, ["http://www.khrunichev.ru/main.php?lang=en"])
        XCTAssertEqual(launch?.lspAgency?.wikiURL, "http://en.wikipedia.org/wiki/Khrunichev_State_Research_and_Production_Space_Center")
    }
    
    func test_lspAgency_isNotEqual() {
        XCTAssertNotEqual(launch?.lspAgency?.id, 999)
        XCTAssertNotEqual(launch?.lspAgency?.name, "xxxxx")
        XCTAssertNotEqual(launch?.lspAgency?.abbrev, "xxxx")
        XCTAssertNotEqual(launch?.lspAgency?.countryCode, "xxx")
        XCTAssertNotEqual(launch?.lspAgency?.type, 999)
        XCTAssertNotEqual(launch?.lspAgency?.infoURLs, ["xxxxn"])
        XCTAssertNotEqual(launch?.lspAgency?.wikiURL, "xxxx")
    }

    func test_lspAgency_changed_isEqual() {
        let date = Date.from(year: 2017, month: 2, day: 21, hour: 0, minute: 0, seconds: 0)
        XCTAssertEqual(launch?.lspAgency?.lastUpdatedDate, date)
    }
    
    func test_lspAgency_changed_isNotEqual() {
        let date = Date.from(year: 2017, month: 2, day: 20, hour: 23, minute: 59, seconds: 59)
        XCTAssertNotEqual(launch?.lspAgency?.lastUpdatedDate, date)
    }
    
    func test_rocket_isEqual() {
        XCTAssertEqual(launch?.rocket?.id, 49)
        XCTAssertEqual(launch?.rocket?.name, "Soyuz 2.1a")
        XCTAssertEqual(launch?.rocket?.configuration, "2.1a")
        // TODO: Only familyname is present here instead of RocketFamily object
//        XCTAssertEqual(launch?.rocket?.family?.name, "Soyuz")
        XCTAssertEqual(launch?.rocket?.wikiURL, "https://en.wikipedia.org/wiki/Soyuz-2#Soyuz-2.1a")
        XCTAssertEqual(launch?.rocket?.infoURLs, [])
        XCTAssertEqual(launch?.rocket?.imageSizes, [320, 480, 640, 720, 768, 800, 960, 1024, 1080, 1280, 1440])
        XCTAssertEqual(launch?.rocket?.imageURL, "https://s3.amazonaws.com/launchlibrary/RocketImages/Soyuz+2.1a_1440.jpg")
    }
    
    func test_rocket_isNotEqual() {
            XCTAssertNotEqual(launch?.rocket?.id, 999)
            XCTAssertNotEqual(launch?.rocket?.name, "xxxx")
            XCTAssertNotEqual(launch?.rocket?.configuration, "xxx")
            // TODO: Only familyname is present here instead of RocketFamily object
    //        XCTAssertEqual(launch?.rocket?.family?.name, "Soyuz")
            XCTAssertNotEqual(launch?.rocket?.wikiURL, "xxx")
            XCTAssertNotEqual(launch?.rocket?.infoURLs, ["xxxx"])
            XCTAssertNotEqual(launch?.rocket?.imageSizes, [])
            XCTAssertNotEqual(launch?.rocket?.imageURL, "xxxx")
        }
}
