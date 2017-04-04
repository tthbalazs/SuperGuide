//
//  ProgramTests.swift
//  SuperGuide
//
//  Created by Tóth Balázs on 2017. 04. 04..
//  Copyright © 2017. Tóth Balázs. All rights reserved.
//

import XCTest
@testable import SuperGuide

class ProgramTests: XCTestCase {
    
    let json: [AnyHashable: Any] = [
        "end_date": "2017-01-16T07:59:33Z",
        "start_date": "2017-01-16T07:19:39Z",
        "title": "Ex Dignissimos Corporis Nostrum Aut"
    ]

    func testInit() {
        guard
            let program = Program(json: json) else {
                return XCTFail()
        }
        
        XCTAssertEqual(program.title, json["title"] as? String)
        
        guard
            let startDateString = json["start_date"] as? String,
            let endDateString = json["end_date"] as? String else {
                return XCTFail()
        }
        
        XCTAssertEqual(Program.dateFormatter.date(from: startDateString)!, program.startDate)
        XCTAssertEqual(Program.dateFormatter.date(from: endDateString)!, program.endDate)
    }
    
}
