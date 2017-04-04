//
//  DataSource.swift
//  SuperGuide
//
//  Created by Tóth Balázs on 2017. 04. 04..
//  Copyright © 2017. Tóth Balázs. All rights reserved.
//

import Foundation
import Alamofire

final class DataSource {
    
    enum Resource {
        case channels
        
        var url: URL {
            switch self {
            case .channels:
                return URL(string: "https://gist.githubusercontent.com/reden87/ad856e7994b8ea93ac27503ecb051347/raw/050c539749f3d253a01ad685983ebc8503ea7872/example.json")!
            }
        }
    }
    
    // MARK: - Loading of resources

    func loadResource(_ resource: Resource, success: @escaping (JSON) -> ()) {
        Alamofire.request(resource.url).responseJSON { response in
            guard
                let json = response.result.value as? JSON else {
                    return
            }
            
            success(json)
        }
    }
    
}
