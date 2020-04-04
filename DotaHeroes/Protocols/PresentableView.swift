//
//  PresentableView.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

protocol PresentableView {
    func presentedViewController() -> UIViewController
}

extension PresentableView where Self: UIViewController {
    func presentedViewController() -> UIViewController {
        return navigationController ?? self
    }
}
