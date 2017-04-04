//
//  ChannelTests.swift
//  SuperGuide
//
//  Created by Tóth Balázs on 2017. 04. 04..
//  Copyright © 2017. Tóth Balázs. All rights reserved.
//

import XCTest
@testable import SuperGuide

class ChannelTests: XCTestCase {
    
    let json: JSON = [
        "id": 0,
        "title": "CHANNEL 1",
        "programme": [
            [
                "title": "Ab Dolorem Sapiente Et",
                "end_date": "2017-01-15T23:46:50Z",
                "start_date":"2017-01-15T23:00:00Z"
            ],[
                "title": "Voluptatem Vero Itaque",
                "end_date": "2017-01-16T00:36:54Z",
                "start_date":"2017-01-15T23:46:50Z"
            ]
        ]
    ]
    
    func testInit() {
        guard
            let channel = Channel(json: json) else {
                return XCTFail()
        }
        
        XCTAssertEqual(channel.id, json["id"] as? Int)
        XCTAssertEqual(channel.title, json["title"] as? String)
        
        XCTAssertTrue(channel.programme.count != 0)
        XCTAssertEqual(channel.programme.count, 2)
    }
}
