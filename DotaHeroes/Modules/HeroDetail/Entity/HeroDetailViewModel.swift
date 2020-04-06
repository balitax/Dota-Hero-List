//  
//  HeroDetailViewModel.swift
//  DotaHeroes
//
//  Created by Agus Cahyono on 04/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import Foundation

class HeroDetailViewModel {
    
    var hero: HeroStorage?
    var similiar = [HeroStorage]() {
        didSet {
            self.createItems()
            print("SIMILI ", similiar)
        }
    }
    
    private(set) var items: [[CommonHeroDetailViewCellKind]] = []
    
    init() {
        
    }
    
    func getItem(at indexPath: IndexPath) -> CellRepresentable {
        let type = items[indexPath.section][indexPath.row]
        switch type {
        case .heroImage:
            return HeaderComponentTableViewCellViewModel(heroImage: self.hero?.img)
        case .heroComponent:
            return HeroComponentsTableViewCellViewModel(hero: self.hero)
        case .heroSimiliar:
            return DotaHeroListsTableViewCellViewModel(
                heroImage: self.similiar[indexPath.row - 2].img,
                heroName: self.similiar[indexPath.row - 2].localizedName,
                heroAttackType: self.similiar[indexPath.row - 2].attackType,
                heroRoles: Array(self.similiar[indexPath.row - 2].roles))
        }
    }
    
    func createItems() {
        var detail: [CommonHeroDetailViewCellKind] = []
        
        detail.append(.heroImage)
        detail.append(.heroComponent)
        
        for _ in similiar {
            detail.append(.heroSimiliar)
        }
        
        items.append(detail)
    }
    
}
