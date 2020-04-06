//
//  HeroListsContract.swift
//  DotaHeroes
//
//  Created by Agus Cahyono on 04/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

protocol HeroListsView: PresentableView, AlertableView {
    // TODO: Declare view methods
    var presenter: HeroListsPresentation! { get set }
    func configureView(with state: ViewStateKind)
    func sortHeroesData(_ sortsBy: [String])
}

protocol HeroListsPresentation: DataSource {
    // TODO: Declare presentation methods
    var view: HeroListsView! { get set }
    var interactor: HeroListsUseCase! { get set }
    var router: HeroListsWireframe! { get set }
    
    func listenLocalData()
    func fetchHeroList()
    func presentHeroSort(_ data: [String], delegate: SortViewDelegate)
    func filterHeroByRoles(_ roles: String)
    func pushDetailHero(_ indexPath: IndexPath)
    
}

protocol HeroListsUseCase: class {
    // TODO: Declare use case methods
    var output: HeroListsInteractorOutput! { get set }
    
    func fetchHeroList()
}

protocol HeroListsInteractorOutput: class {
    // TODO: Declare interactor output methods
    func onError(error: Error)
    func onHeroSuccess()
}

protocol HeroListsWireframe: class {
    // TODO: Declare wireframe methods
    var viewController: UIViewController? { get set }
    static func assembleModule() -> UIViewController
    func showSortUI(_ data: [String], delegate: SortViewDelegate, from view: PresentableView)
    func pushDetailHero(_ data: HeroStorage, similiar: [HeroStorage], from view: PresentableView)
}

