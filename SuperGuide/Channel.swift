//
//  Channel.swift
//  SuperGuide
//
//  Created by Tóth Balázs on 2017. 04. 04..
//  Copyright © 2017. Tóth Balázs. All rights reserved.
//

import Foundation
import UIKit

struct Channel {
    let id: Int
    let title: String
    let programme: [Program]
    
    var fullWidth: CGFloat {
        return programme.reduce(0, { (result, program) -> CGFloat in
            return result + program.cellSize.width
        })
    }
    
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
