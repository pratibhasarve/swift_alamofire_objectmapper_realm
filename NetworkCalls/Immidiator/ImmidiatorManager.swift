//
//  ImmidiatorManager.swift
//  NetworkCalls
//
//  Created by Pratibha Sarve on 15/12/17.
//  Copyright © 2017 Pratibha Sarve. All rights reserved.
//

import Foundation

class ImmidiatorManager{
    
    let apiRequestAlomo = ApiRequests()
    
    /** This method will get you login to app */
    func getLogin(completion: @escaping ((_ result: GetUnknownResponse) -> Void)) {
        
        apiRequestAlomo.getMethod(type: GetUnknownResponse.self, success: { (response) in

           // Data save into Db
            let result = response
            let dbManager = DbManager()
            dbManager.saveLoginResponse(getUnknownResponse: result)
            dbManager.getLoginResponse()
            completion(result)
        }) { (error) in
            print(error)
            // Error handling
        }
    }
    
    
    func getPost(params:Dictionary<String,Any>, completion: @escaping ((_ result: PostResponse) -> Void)){
        apiRequestAlomo.postMethod(type: PostResponse.self, params: params, success: {(response) in
            // Data save into Db
            let result = response
             completion(result)
            }) { (error) in
                 print(error)
        }
    }
    
}
