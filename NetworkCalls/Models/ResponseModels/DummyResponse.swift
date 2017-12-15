//
//  DummyResponse.swift
//  NetworkCalls
//
//  Created by Pratibha Sarve on 13/12/17.
//  Copyright © 2017 Pratibha Sarve. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class DummyResponse: Object, Mappable {
    
    var name: String?
    var job: String?
    var id: String?
    var createdAt: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
         name <- map["name"]
         job <- map["job"]
         id <- map["id"]
         createdAt <- map["createdAt"]
    }
    
}
