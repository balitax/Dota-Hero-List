//  
//  HeroListsPresenter.swift
//  DotaHeroes
//
//  Created by Agus Cahyono on 04/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit


/// HeroListsPresenter
class HeroListsPresenter {
    // TODO: Declare view methods
    var view: HeroListsView!
    var viewModel: HeroListsViewModel!
    var router: HeroListsWireframe!
    var interactor: HeroListsUseCase!
    
    init(
        view: HeroListsView,
        viewModel: HeroListsViewModel,
        interactor: HeroListsUseCase,
        router: HeroListsWireframe) {
        
        self.view = view
        self.viewModel = viewModel
        self.interactor = interactor
        self.router = router
        
    }
    
}

extension HeroListsPresenter: HeroListsPresentation {
    
    func numberOfSection() -> Int {
        viewModel.items.count
    }
    
    func numberOfRow(in section: Int) -> Int {
        viewModel.items[section].count
    }
    
    func item(at indexPath: IndexPath) -> CellRepresentable {
        viewModel.getItem(at: indexPath)
    }
    
    func fetchHeroList() {
        interactor.fetchHeroList()
    }
    
    func presentHeroSort(_ data: [String], delegate: SortViewDelegate) {
        router.showSortUI(data, delegate: delegate, from: view)
    }
    
    func filterHeroByRoles(_ roles: String) {
        
        if roles == "All" {
            viewModel.heroes = viewModel.tempHeroes
        } else {
            let filter = viewModel.tempHeroes.filter ({
                ($0.roles?.contains(where: { $0 == roles }) ?? false)
            })
            viewModel.heroes = filter
        }
        
        viewModel.createItems()
        if viewModel.heroes.count == 0 {
            self.view.configureView(with: .empty)
        } else {
            self.view.configureView(with: .success)
        }
        
    }
    
    func pushDetailHero(_ data: [String]) {
        router.pushDetailHero(data, from: view)
    }
    
}

extension HeroListsPresenter: HeroListsInteractorOutput {
    
    func onHeroSuccess(_ data: [Hero]) {
        viewModel.heroes = data
        viewModel.tempHeroes = data
        viewModel.createItems()
        self.view.configureView(with: .success)

        // Fetch Roles
        var theRoles = [String]()
        theRoles.append("All")
        
        for roles in data {
            if let herosRole = roles.roles {
                theRoles += herosRole
            }
        }
        
         theRoles.append("Empty")
        
        self.view.sortHeroesData(theRoles.removeDuplicates())
        
    }
    
    func onError(error: Error) {
        self.view.configureView(with: .error(description: error.localizedDescription))
    }
    
}
