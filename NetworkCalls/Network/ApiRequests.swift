//
//  ApiRequests.swift
//  NetworkCalls
//
//  Created by Pratibha Sarve on 14/12/17.
//  Copyright © 2017 Pratibha Sarve. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper


class ApiRequests{
    
    /** This method is used for HTTP GET type rquest to the server */
    func getMethod <T:AnyObject> (type:T.Type, success:@escaping (T)->Void,fail:@escaping (_ error:NSError)->Void)->Void where T:Mappable,T:Meta {
        Alamofire.request(type.url(), method: .get)
            .responseObject { (response: DataResponse<T>) in
                if let genericResponse =  response.result.value {
                    success(genericResponse)
                }else{
                    print("Error")
                    fail(NSError())
                }
         }
    }
    
    /** This method is used for HTTP Post type  request to the server */
    func postMethod <T:AnyObject> (type:T.Type, params:Dictionary<String,Any>, success:@escaping (T)->Void,fail:@escaping (_ error:NSError)->Void)->Void where T:Mappable,T:Meta {
        Alamofire.request(type.url(), method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil)
            .responseObject { (response: DataResponse<T>) in
                if let genericResponse =  response.result.value {
                    success(genericResponse)
                }else{
                    print("Error")
                    fail(NSError())
                }
        }
    }
    
}
