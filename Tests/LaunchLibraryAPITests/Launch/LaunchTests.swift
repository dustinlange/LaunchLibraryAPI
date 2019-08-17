//
//  LaunchTests.swift
//  LaunchLibraryAPITests
//
//  Created by Dustin Lange on 8/16/19.
//

import XCTest
@testable import LaunchLibraryAPI

class LaunchTests: XCTestCase {
    private(set) var launch: Launch?
    
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

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
