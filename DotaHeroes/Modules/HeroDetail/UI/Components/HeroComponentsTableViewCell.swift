//
//  HeroComponentsTableViewCell.swift
//  DotaHeroes
//
//  Created by Agus Cahyono on 06/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

class HeroComponentsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var rolesLabel: UILabel!
    @IBOutlet weak var heroIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension HeroComponentsTableViewCell: CellConfigurable {
    
    func configure(with model: CellRepresentable) {
        if let data = model as? HeroComponentsTableViewCellViewModel {
            
            if let roles = data.hero?.roles {
                self.rolesLabel.text = roles.joined(separator: ", ")
            }
            
            if let icon = data.hero?.icon {
                self.heroIcon.setImage(icon)
            }
            
        }
    }
}

extension HeroComponentsTableViewCell: Reusable { }
