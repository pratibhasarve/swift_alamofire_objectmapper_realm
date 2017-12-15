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
    
    func postRequest(methodUrl: String, params:Dictionary<String,Any>,completion: @escaping ((_ data: DummyResponse) -> Void)){
        
        let url = AppConstant.BASE_URL + methodUrl
        
        request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseObject
            { (response: DataResponse<DummyResponse>) in
                if let dummyResponse =  response.result.value{
                    
                    completion(dummyResponse)
                }else{
                    print("Error")
                }
        }
    }
    
    func getRequest(methodUrl: String, completion: @escaping ((_ data: GetUnknownResponse) -> Void)){
        
        let url = AppConstant.BASE_URL + methodUrl
        request(url, method: .get, encoding: JSONEncoding.default, headers: nil).responseObject
            { (response: DataResponse<GetUnknownResponse>) in
                if let dummyResponse =  response.result.value{
                    print(dummyResponse.data![1].color)
                    let dbManager = DbManager()
                    dbManager.saveLoginResponse(getUnknownResponse: dummyResponse)
                    dbManager.getLoginResponse()
                    completion(dummyResponse)
                }else{
                    print("Error")
                }
        }
        
    }
    
    func getMethod <T:AnyObject> (type:T.Type,success:@escaping (T)->Void,fail:@escaping (_ error:NSError)->Void)->Void where T:Mappable,T:Meta {
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
    
}
