//  
//  HeroListsRouter.swift
//  DotaHeroes
//
//  Created by Agus Cahyono on 04/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//


import Foundation
import UIKit

class HeroListsRouter {

    weak var viewController: UIViewController?

}

extension HeroListsRouter: HeroListsWireframe {
    
    static func assembleModule() -> UIViewController {
        
        let view = HeroListsUI()
        let viewModel = HeroListsViewModel()
        let router = HeroListsRouter()
        let interactor = HeroListsInteractor()
        
        let presenter = HeroListsPresenter(
        view: view,
        viewModel: viewModel,
        interactor: interactor,
        router: router)
        
        
        let navigation = UINavigationController(rootViewController: view)
        
        view.presenter =  presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.viewController = view
        
        interactor.output = presenter
        
        return navigation
    }
    
    func showSortUI(_ data: [String], delegate: SortViewDelegate, from view: PresentableView) {
        
        let sortView = SortView()
        sortView.sorts = data
        sortView.delegate = delegate
        
        let embedNavigationController = UINavigationController(rootViewController: sortView)
        embedNavigationController.modalPresentationStyle = .overFullScreen
        if let navigationController = view.presentedViewController() as? UINavigationController {
            navigationController.present(embedNavigationController, animated: true, completion: nil)
        }
    }
    
    func pushDetailHero(_ data: HeroStorage, similiar: [HeroStorage], from view: PresentableView) {
        let detail = HeroDetailRouter.assembleModule(data, similiar: similiar)
        if let navigationController = view.presentedViewController() as? UINavigationController {
            navigationController.pushViewController(detail, animated: true)
        }
    }
    
    
}
