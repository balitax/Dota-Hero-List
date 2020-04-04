//
//  UIView+Extensions.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

extension UIButton {
    
    func enableButton() {
        self.backgroundColor = .defaultTheme
        self.isEnabled = true
        self.isUserInteractionEnabled = true
    }
    
    func disableButton() {
        self.backgroundColor = .gray
        self.isEnabled = false
        self.isUserInteractionEnabled = false
    }
    
}

