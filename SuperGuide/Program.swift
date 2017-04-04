//
//  Program.swift
//  SuperGuide
//
//  Created by Tóth Balázs on 2017. 04. 04..
//  Copyright © 2017. Tóth Balázs. All rights reserved.
//

import Foundation

struct Program {
    let title: String
    let startDate: Date
    let endDate: Date
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssX"
        formatter.timeZone = TimeZone.autoupdatingCurrent
        return formatter
    }()
    
    init?(json: [AnyHashable: Any]) {
        guard
            let title = json["title"] as? String,
            let startDateString = json["start_date"] as? String,
            let endDateString = json["end_date"] as? String,
            let startDate = Program.dateFormatter.date(from: startDateString),
            let endDate = Program.dateFormatter.date(from: endDateString) else {
                return nil
        }
        
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
    }
}
