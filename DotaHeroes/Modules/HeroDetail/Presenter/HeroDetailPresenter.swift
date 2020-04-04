//  
//  HeroDetailPresenter.swift
//  DotaHeroes
//
//  Created by Agus Cahyono on 04/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit


/// HeroDetailPresenter
class HeroDetailPresenter {
    // TODO: Declare view methods
    var view: HeroDetailView!
    var viewModel: HeroDetailViewModel!
    var router: HeroDetailWireframe!
    var interactor: HeroDetailUseCase!
    
    init(
        view: HeroDetailView,
        viewModel: HeroDetailViewModel,
        interactor: HeroDetailUseCase,
        router: HeroDetailWireframe) {
        
        self.view = view
        self.viewModel = viewModel
        self.interactor = interactor
        self.router = router
        
    }
    
}

extension HeroDetailPresenter: HeroDetailPresentation {
    
    func viewDidLoad() {  }
    
}

extension HeroDetailPresenter: HeroDetailInteractorOutput {
    
}
