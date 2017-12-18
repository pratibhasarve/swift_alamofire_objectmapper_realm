//
//  Data.swift
//  NetworkCalls
//
//  Created by Pratibha Sarve on 14/12/17.
//  Copyright © 2017 Pratibha Sarve. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class Data: Object, Mappable{
    
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var pantoneValue = ""
    @objc dynamic var year = 0
    @objc dynamic var color = ""
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map)
    {
        id <- map["id"]
        name <- map["name"]
        pantoneValue <- map["pantone_value"]
        year <- map["year"]
        color <- map["color"]
        
    }
}
