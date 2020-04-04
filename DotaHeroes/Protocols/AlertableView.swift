//
//  AlertableView.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

protocol AlertableView {
    func showAlert(viewController: UIViewController, prefferedStyle: UIAlertController.Style, title: String?, message: String?, alertActions: [UIAlertAction]?)
}

extension AlertableView {
    func showAlert(viewController: UIViewController, prefferedStyle: UIAlertController.Style, title: String? = nil, message: String? = nil, alertActions: [UIAlertAction]? = []) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: prefferedStyle)
        alertActions?.forEach({ alert.addAction($0) })
        viewController.present(alert, animated: true, completion: nil)
    }
}
