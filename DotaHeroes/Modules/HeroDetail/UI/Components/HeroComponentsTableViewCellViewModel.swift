//
//  HeroComponentsTableViewCellViewModel.swift
//  DotaHeroes
//
//  Created by Agus Cahyono on 06/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import Foundation

struct HeroComponentsTableViewCellViewModel: CellRepresentable {
    
    var hero: HeroStorage?
    
    init(hero: HeroStorage?) {
        self.hero = hero
    }
    
    var type: String = {
        return HeroDetailCellType.heroComponent.rawValue
    }()
    
}
