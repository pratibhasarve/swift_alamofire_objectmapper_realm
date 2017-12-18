//
//  UserRequestModel.swift
//  NetworkCalls
//
//  Created by Pratibha Sarve on 14/12/17.
//  Copyright © 2017 Pratibha Sarve. All rights reserved.
//

import Foundation

class UserRequestModel{

    var name : String?
    var job : String?
    
    func toJSON() -> [String: Any] {
        return [
            "name": name as Any,
            "job": job as Any,
        ]
    }
}
