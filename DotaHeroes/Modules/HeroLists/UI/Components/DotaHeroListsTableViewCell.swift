//
//  DotaHeroListsTableViewCell.swift
//  DotaHeroes
//
//  Created by Agus Cahyono on 04/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

class DotaHeroListsTableViewCell: UITableViewCell, Reusable {
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroAttackType: UILabel!
    @IBOutlet weak var heroRoles: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.heroImage.layer.cornerRadius = 8
        self.heroImage.clipsToBounds = true
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension DotaHeroListsTableViewCell: CellConfigurable {
    
    func configure(with model: CellRepresentable) {
        if let data = model as? DotaHeroListsTableViewCellViewModel {
            
            if let image = data.heroImage {
                self.heroImage.setImage(image)
            }
            
            self.heroName.text = data.heroName
            self.heroAttackType.text = data.heroAttackType
            
            if let roles = data.heroRoles {
                self.heroRoles.text = roles.joined(separator: ", ")
            }
            
        }
    }
    
}
