//  
//  HeroDetailViewModel.swift
//  DotaHeroes
//
//  Created by Agus Cahyono on 04/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import Foundation

class HeroDetailViewModel {
    
    private(set) var items: [[CommonHeroDetailViewCellKind]] = []
    
    init() {
        items = [
            [
                .list
            ]
        ]
    }
    
//    func getItem(at indexPath: IndexPath) -> CellRepresentable {
//        let type = items[indexPath.section][indexPath.row]
//        switch type {
//        case .pattern:
//            break
//        default:
//            break
//        }
//    }
    
}
