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
    
    var navigationTitle: String! {
        return viewModel.hero?.localizedName ?? ""
    }
    
    func numberOfSection() -> Int {
        viewModel.items.count
    }
    
    func numberOfRow(in section: Int) -> Int {
        return viewModel.items[section].count
    }
    
    func item(at indexPath: IndexPath) -> CellRepresentable {
        viewModel.getItem(at: indexPath)
    }
    
}

extension HeroDetailPresenter: HeroDetailInteractorOutput {
    
}
