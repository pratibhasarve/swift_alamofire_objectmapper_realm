//
//  GetUnknownResponse.swift
//  NetworkCalls
//
//  Created by Pratibha Sarve on 14/12/17.
//  Copyright © 2017 Pratibha Sarve. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

protocol Meta {
    static func url()->String
}

class GetUnknownResponse:Object, Mappable, Meta{
    
    var page : Int?
    var perPage : Int?
    var total : Int?
    var totalPages : Int?
    var data:[Data]?
    //var data = List<Data>()

    

    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map)
    {
        page <- map["page"]
        perPage <- map["per_page"]
        total <- map["total"]
        totalPages <- map["total_pages"]
        data <- map["data"]
    }
    
    //Impl. of Meta protocol
    static func url()->String {
        return AppConstant.BASE_URL + "unknown"
    }
}
