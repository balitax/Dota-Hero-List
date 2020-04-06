//  
//  HeroListsInteractor.swift
//  DotaHeroes
//
//  Created by Agus Cahyono on 04/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit
import RxSwift

class HeroListsInteractor {
    // TODO: Declare view methods
    weak var output: HeroListsInteractorOutput!
    private var disposeBag = DisposeBag()
}

extension HeroListsInteractor: HeroListsUseCase {
    
    func fetchHeroList() {
        APIClient.request(with: APIRouter.list, codable: Heroes.self)
            .map({ (response) -> [HeroStorage] in
                
                APIClient.deleteLocalDatabase(HeroStorage.self)
                
                var heroes = [HeroStorage]()
                
                for (_, item)  in response.enumerated() {
                    let save = HeroStorage().apply { hero in
                        hero.id = item.id ?? 0
                        hero.name = item.name
                        hero.localizedName = item.localizedName
                        hero.primaryAttr = item.primaryAttr
                        hero.attackType = item.attackType
                        
                        // roles
                        if let roles = item.roles {
                            roles.forEach { role in
                                hero.roles.append(role)
                            }
                        }
                        
                        hero.img = item.img
                        hero.icon = item.icon
                        hero.attackRange = item.attackRange ?? 0
                        hero.projectileSpeed = item.projectileSpeed ?? 0
                        hero.attackRate = item.attackRate ?? 0.0
                        hero.moveSpeed = item.moveSpeed ?? 0
                        hero.turnRate = item.turnRate ?? 0.0
                        hero.cmEnabled = item.cmEnabled ?? false
                        hero.legs = item.legs ?? 0
                        hero.proBan = item.proBan ?? 0
                        hero.heroID = item.heroID ?? 0
                    }
                    heroes.append(save)
                }
                
                return heroes
            })
            .asObservable()
            .flatMapLatest({ (heroes) -> Single<[HeroStorage]> in
                return Database.shared.rxsave(objects: heroes)
            })
            .subscribe(onNext: { herolist in
                self.output.onHeroSuccess()
            }, onError: { error in
                self.output.onError(error: error)
            }).disposed(by: disposeBag)
    }
    
    
}
