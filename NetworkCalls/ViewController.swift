//
//  ViewController.swift
//  NetworkCalls
//
//  Created by Pratibha Sarve on 13/12/17.
//  Copyright © 2017 Pratibha Sarve. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userRequestModel = UserRequestModel()
        userRequestModel.name = "morpheus"
        userRequestModel.job = "leader"
        
       /**  let apiRequestAlomo = ApiRequests()
        apiRequestAlomo.postRequest(methodUrl: "users", params: userRequestModel.toJSON()){ [weak self] (data: DummyResponse) in
            self?.useData(dummyResponse: data as! DummyResponse)
        } */
        
        
        /** let apiRequestAlomo = ApiRequests()
        apiRequestAlomo.getRequest(methodUrl: "unknown"){ [weak self] (data: GetUnknownResponse) in
            self?.useData(data: data as! GetUnknownResponse)
        }*/
        
        let immidiatorManager = ImmidiatorManager()
        immidiatorManager.getLogin(){
            (result) -> () in
            self.useData(resultUI: result)
        }
        
        immidiatorManager.getPost(params: userRequestModel.toJSON()){
            (result) -> () in
            self.useData(resultUI: result)
        }
    }
    
    func useData(resultUI: PostResponse){
        // Update UI
        let output = "Response on ViewController " + ": " + resultUI.job!
        print(output)
    }
    
    func useData(resultUI: GetUnknownResponse){
     // Update UI
        let output = "Response on ViewController " + ": " + resultUI.data![0].color
        print(output)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

