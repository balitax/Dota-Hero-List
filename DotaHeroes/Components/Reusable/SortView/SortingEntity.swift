//
//  SortingEntity.swift
//  DotaHeroes
//
//  Created by Agus Cahyono on 04/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import Foundation

class SortingEntity {
    
    static var shared = SortingEntity()
    
    let keySort = "sort"
    
    var userDefault = UserDefaults.standard
    
    func saveSortingEntity(value: String) {
        userDefault.set(value, forKey: keySort)
        userDefault.synchronize()
    }
    
    func getSortingEntity(key: String) -> String {
        let data = userDefault.object(forKey: keySort)
        if data != nil {
            return data as! String
        } else {
            return ""
        }
    }
    
    func removeAllEntity() {
        userDefault.removeObject(forKey: keySort)
        userDefault.synchronize()
    }
    
}
