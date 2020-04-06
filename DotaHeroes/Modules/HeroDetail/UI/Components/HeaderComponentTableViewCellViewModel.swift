//
//  HeaderComponentTableViewCellViewModel.swift
//  DotaHeroes
//
//  Created by Agus Cahyono on 06/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import Foundation

struct HeaderComponentTableViewCellViewModel: CellRepresentable {
    
    var heroImage: String?
    
    init(heroImage: String?) {
        self.heroImage = heroImage
    }
    
    init() {
        
    }
    
    var type: String = {
        return HeroDetailCellType.heroImage.rawValue
    }()
    
}
