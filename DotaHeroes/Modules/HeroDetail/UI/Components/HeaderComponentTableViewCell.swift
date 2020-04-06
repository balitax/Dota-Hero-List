//
//  HeaderComponentTableViewCell.swift
//  DotaHeroes
//
//  Created by Agus Cahyono on 05/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

class HeaderComponentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var heroImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension HeaderComponentTableViewCell: CellConfigurable {
    func configure(with model: CellRepresentable) {
        if let data = model as? HeaderComponentTableViewCellViewModel {
            
            if let image = data.heroImage {
                self.heroImage.setImage(image)
            }
            
        }
    }
}

extension HeaderComponentTableViewCell: Reusable { }
