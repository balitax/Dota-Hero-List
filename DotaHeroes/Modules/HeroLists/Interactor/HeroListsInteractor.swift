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
            .asObservable()
            .subscribe(onNext: { herolist in
                self.output.onHeroSuccess(herolist)
            }, onError: { error in
                self.output.onError(error: error)
            }).disposed(by: disposeBag)
    }
    
    
}
