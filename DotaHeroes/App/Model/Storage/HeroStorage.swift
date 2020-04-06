//
//  HeroStorage.swift
//  DotaHeroes
//
//  Created by Agus Cahyono on 05/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import Foundation
import RealmSwift

class HeroStorage: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String?
    @objc dynamic var localizedName: String?
    @objc dynamic var primaryAttr: String?
    @objc dynamic var attackType: String?
    var roles = List<String>()
    @objc dynamic var img: String?
    @objc dynamic var icon: String?
    @objc dynamic var attackRange: Int = 0
    @objc dynamic var projectileSpeed: Int = 0
    @objc dynamic var attackRate: Double = 0.0
    @objc dynamic var moveSpeed: Int = 0
    @objc dynamic var turnRate: Double = 0.0
    @objc dynamic var cmEnabled: Bool = false
    @objc dynamic var legs: Int = 0
    @objc dynamic var proBan: Int = 0
    @objc dynamic var heroID: Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }

    
}
