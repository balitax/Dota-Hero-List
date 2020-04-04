//  
//  HeroListsViewModel.swift
//  DotaHeroes
//
//  Created by Agus Cahyono on 04/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import Foundation

class HeroListsViewModel {
    
    var heroes = [Hero]()
    var tempHeroes = [Hero]()
    
    private(set) var items: [[CommonHeroListsViewCellKind]] = []
    
    init() {
        items = [
            [
            
            ]
        ]
    }
    
    func getItem(at indexPath: IndexPath) -> CellRepresentable {
        let type = items[indexPath.section][indexPath.row]
        switch type {
        case .list:
            return DotaHeroListsTableViewCellViewModel(
                heroImage: self.heroes[indexPath.row].img,
                heroName: self.heroes[indexPath.row].localizedName,
                heroAttackType: self.heroes[indexPath.row].attackType,
                heroRoles: self.heroes[indexPath.row].roles)
        }
    }
    
    func createItems() {
        var listsMovie: [CommonHeroListsViewCellKind] = []
        
        for _ in heroes {
            listsMovie.append(.list)
        }
        
        items.removeAll()
        items.append(listsMovie)
    }
    
}
