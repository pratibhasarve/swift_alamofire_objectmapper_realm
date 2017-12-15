//
//  DBManager.swift
//  NetworkCalls
//
//  Created by Pratibha Sarve on 14/12/17.
//  Copyright © 2017 Pratibha Sarve. All rights reserved.
//

import Foundation
import RealmSwift

class DbManager{
    
    var realm: Realm!

    
    init() {
        self.realm = try! Realm()
    }
    
    
    func saveLoginResponse(getUnknownResponse :GetUnknownResponse){
        
       // let realm = try! Realm()
        for data in getUnknownResponse.data! {
            try! self.realm.write {
                self.realm.add(data, update: false)
            }
        }
    }
    
    func  getLoginResponse(){
        
        //let realm = try! Realm()
        let data = Array(realm.objects(Data.self))
        print(data[2].name)
    }
    
    
    
}
