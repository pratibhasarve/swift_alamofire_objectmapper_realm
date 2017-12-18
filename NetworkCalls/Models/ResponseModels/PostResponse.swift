//
//  PostResponse.swift
//  NetworkCalls
//
//  Created by Pratibha Sarve on 18/12/17.
//  Copyright © 2017 Pratibha Sarve. All rights reserved.
//

import Foundation
import ObjectMapper

class PostResponse: Mappable, Meta{
    
    var name: String?
    var job: String?
    var id: String?
    var createdAt: String?
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map)
    {
        name <- map["name"]
        job <- map["job"]
        id <- map["id"]
        createdAt <- map["createdAt"]
    }
    
    //Impl. of Meta protocol
    static func url()->String {
        return AppConstant.BASE_URL + "users"
    }
    
}
