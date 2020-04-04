//  
//  HeroDetailRouter.swift
//  DotaHeroes
//
//  Created by Agus Cahyono on 04/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//


import Foundation
import UIKit

class HeroDetailRouter {

    weak var viewController: UIViewController?

}

extension HeroDetailRouter: HeroDetailWireframe {
    
    static func assembleModule() -> UIViewController {
        
        let view = HeroDetailUI()
        let viewModel = HeroDetailViewModel()
        let router = HeroDetailRouter()
        let interactor = HeroDetailInteractor()
        
        let presenter = HeroDetailPresenter(
        view: view,
        viewModel: viewModel,
        interactor: interactor,
        router: router)
        
        view.presenter =  presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.viewController = view
        
        interactor.output = presenter
        
        return view
    }
    
}
