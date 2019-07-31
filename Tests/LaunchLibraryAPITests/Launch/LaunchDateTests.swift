//
//  LaunchDateTests.swift
//
//
//  Created by Dustin Lange on 7/30/19.
//

import Foundation
import XCTest
@testable import LaunchLibraryAPI

final class LaunchDateTests: XCTestCase {
    private var launch: Launch?
    
    override func setUp() {
        super.setUp()
        
        guard let data = json.data(using: .utf8) else {
            XCTFail("Failed to decode file to data object")
            return
        }
        
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(PaginatedResponse<Launch>.self, from: data) else {
            XCTFail("Failed to decode to JSON object")
            return
        }
        
        launch = result.results.first
    }
    
    func test_launch_startDate_isEqual() {
        let date = Date.from(year: 2019, month: 7, day: 31, hour: 12, minute: 10, seconds: 46)
        XCTAssertEqual(launch?.startDateUTC, date)
    }
    
    func test_launch_endDate_isEqual() {
        let date = Date.from(year: 2019, month: 7, day: 31, hour: 12, minute: 10, seconds: 46)
        XCTAssertEqual(launch?.endDateUTC, date)
    }
    
    func test_launch_netDate_isEqual() {
        let date = Date.from(year: 2019, month: 7, day: 31, hour: 12, minute: 10, seconds: 46)
        XCTAssertEqual(launch?.netDateUTC, date)
    }
    
    func test_launch_windowStartDate_isEqual() {
        let date = Date.from(year: 2019, month: 7, day: 31, hour: 12, minute: 10, seconds: 46)
        XCTAssertEqual(launch?.windowStartDateUTC, date)
    }
    
    func test_launch_windowEndDate_isEqual() {
        let date = Date.from(year: 2019, month: 7, day: 31, hour: 12, minute: 10, seconds: 46)
        XCTAssertEqual(launch?.windowEndDateUTC, date)
    }
    
    func test_launch_windowNETDate_isEqual() {
        let date = Date.from(year: 2019, month: 7, day: 31, hour: 12, minute: 10, seconds: 46)
        XCTAssertEqual(launch?.windowNETDateUTC, date)
    }
    
    func test_launch_lastUpdatedDate_isEqual() {
        let date = Date.from(year: 2019, month: 7, day: 29, hour: 8, minute: 11, seconds: 40)
        XCTAssertEqual(launch?.lastUpdatedDate, date)
    }
}

fileprivate extension Date {
    static func from(year: Int, month: Int, day: Int, hour: Int, minute: Int, seconds: Int) -> Date? {
        var calendar = Calendar(identifier: .iso8601)
        calendar.locale = Locale(identifier: "en_US_POSIX")
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = seconds
        
        return calendar.date(from: dateComponents) ?? nil
    }
}

fileprivate let json = """
{
    "launches": [
        {
            "id": 1663,
            "name": "Soyuz 2.1a | Progress MS-12 (73P)",
            "windowstart": "July 31, 2019 12:10:46 UTC",
            "windowend": "July 31, 2019 12:10:46 UTC",
            "net": "July 31, 2019 12:10:46 UTC",
            "wsstamp": 1564575046,
            "westamp": 1564575046,
            "netstamp": 1564575046,
            "isostart": "20190731T121046Z",
            "isoend": "20190731T121046Z",
            "isonet": "20190731T121046Z",
            "status": 1,
            "inhold": 0,
            "tbdtime": 0,
            "vidURLs": [
                "https://www.youtube.com/watch?v=IFMYYTdVC4Q"
            ],
            "vidURL": null,
            "infoURLs": [],
            "infoURL": null,
            "holdreason": null,
            "failreason": null,
            "tbddate": 0,
            "probability": -1,
            "hashtag": null,
            "changed": "2019-07-29 08:11:40",
            "location": {
                "pads": [
                    {
                        "id": 29,
                        "name": "1/5, Baikonur Cosmodrome, Kazakhstan",
                        "infoURL": "",
                        "wikiURL": "",
                        "latitude": 45.92,
                        "longitude": 63.342,
                        "agencies": []
                    }
                ],
                "id": 10,
                "name": "Baikonur Cosmodrome, Republic of Kazakhstan",
                "infoURL": "",
                "wikiURL": "",
                "countryCode": "KAZ"
            },
            "rocket": {
                "id": 49,
                "name": "Soyuz 2.1a",
                "configuration": "2.1a",
                "familyname": "Soyuz",
                "agencies": [],
                "wikiURL": "https://en.wikipedia.org/wiki/Soyuz-2#Soyuz-2.1a",
                "infoURLs": [],
                "imageSizes": [
                    320,
                    480,
                    640,
                    720,
                    768,
                    800,
                    960,
                    1024,
                    1080,
                    1280,
                    1440
                ],
                "imageURL": "https://s3.amazonaws.com/launchlibrary/RocketImages/Soyuz+2.1a_1440.jpg"
            },
            "missions": [
                {
                    "id": 1163,
                    "name": "Progress MS-12 (73P)",
                    "description": "The Progress resupply vehicle is an automated, unpiloted version of the Soyuz spacecraft that is used to bring supplies and fuel to the International Space Station.",
                    "type": 11,
                    "wikiURL": "https://en.wikipedia.org/wiki/Progress_MS-12",
                    "typeName": "Resupply",
                    "agencies": [
                        {
                            "id": 63,
                            "name": "Russian Federal Space Agency (ROSCOSMOS)",
                            "abbrev": "RFSA",
                            "countryCode": "RUS",
                            "type": 1,
                            "infoURL": null,
                            "wikiURL": "http://en.wikipedia.org/wiki/Russian_Federal_Space_Agency",
                            "changed": "2017-02-21 00:00:00",
                            "infoURLs": [
                                "http://en.roscosmos.ru/",
                                "https://www.youtube.com/channel/UCOcpUgXosMCIlOsreUfNFiA",
                                "https://twitter.com/Roscosmos",
                                "https://www.facebook.com/Roscosmos"
                            ]
                        }
                    ],
                    "payloads": []
                }
            ],
            "lsp": {
                "id": 96,
                "name": "Khrunichev State Research and Production Space Center",
                "abbrev": "KhSC",
                "countryCode": "RUS",
                "type": 1,
                "infoURL": "http://www.khrunichev.ru/main.php?lang=en",
                "wikiURL": "http://en.wikipedia.org/wiki/Khrunichev_State_Research_and_Production_Space_Center",
                "changed": "2017-02-21 00:00:00",
                "infoURLs": [
                    "http://www.khrunichev.ru/main.php?lang=en"
                ]
            }
        }
    ],
    "total": 1,
    "offset": 0,
    "count": 1
}
"""
