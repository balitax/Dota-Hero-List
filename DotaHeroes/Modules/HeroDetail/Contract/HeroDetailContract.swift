//  
//  HeroDetailContract.swift
//  DotaHeroes
//
//  Created by Agus Cahyono on 04/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

protocol HeroDetailView: PresentableView {
    // TODO: Declare view methods
    var presenter: HeroDetailPresentation! { get set }
}

protocol HeroDetailPresentation: class {
    // TODO: Declare presentation methods
    var view: HeroDetailView! { get set }
    var interactor: HeroDetailUseCase! { get set }
    var router: HeroDetailWireframe! { get set }
    
    func viewDidLoad()
}

protocol HeroDetailUseCase: class {
    // TODO: Declare use case methods
    var output: HeroDetailInteractorOutput! { get set }
}

protocol HeroDetailInteractorOutput: class {
    // TODO: Declare interactor output methods
}

protocol HeroDetailWireframe: class {
    // TODO: Declare wireframe methods
    var viewController: UIViewController? { get set }
    static func assembleModule() -> UIViewController
}

