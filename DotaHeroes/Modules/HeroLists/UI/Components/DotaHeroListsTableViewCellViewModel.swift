//
//  DotaHeroListsTableViewCellViewModel.swift
//  DotaHeroes
//
//  Created by Agus Cahyono on 04/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import Foundation

struct DotaHeroListsTableViewCellViewModel: CellRepresentable {
    
    var heroImage: String?
    var heroName: String?
    var heroAttackType: String?
    var heroRoles: [String]?
    
    init(heroImage: String?, heroName: String?, heroAttackType: String?, heroRoles: [String]?) {
        self.heroImage = heroImage
        self.heroName = heroName
        self.heroAttackType = heroAttackType
        self.heroRoles = heroRoles
    }
    
    init() {
        
    }
    
    var type: String = {
        return HeroListsCellType.list.rawValue
    }()
    
}
