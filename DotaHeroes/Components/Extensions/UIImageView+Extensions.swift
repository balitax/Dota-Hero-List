//
//  UIImageView+Extensions.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import Foundation
import Kingfisher

public extension UIImageView {
    
    func setImage(_ imgPath: String) {
        
        let url = URL(string: Constant.imagePath + imgPath)
        self.kf.indicatorType = .activity
        
        self.kf.setImage(
        with: url,
        placeholder: UIImage(named: "placeholderImage"),
        options: [
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(1)),
            .cacheOriginalImage
        ])
    }
    
}
