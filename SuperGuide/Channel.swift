//
//  Channel.swift
//  SuperGuide
//
//  Created by Tóth Balázs on 2017. 04. 04..
//  Copyright © 2017. Tóth Balázs. All rights reserved.
//

import Foundation

struct Channel {
    let id: Int
    let title: String
    let programme: [Program]
    
    init?(json: JSON) {
        guard
            let id = json["id"] as? Int,
            let title = json["title"] as? String,
            let programme = json["programme"] as? [JSON] else {
                return nil
        }
        
        self.id = id
        self.title = title
        self.programme = programme.flatMap(Program.init)
    }
    
}
