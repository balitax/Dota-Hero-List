//
//  ListItemTableViewCell.swift
//  DotaHeroes
//
//  Created by Agus Cahyono on 04/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

class ListItemTableViewCell: UITableViewCell, Reusable {
    
    @IBOutlet weak var itemTitle: UILabel!
     @IBOutlet weak var selectedImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func selectRow() {
        selectedImageView.isHidden = false
    }
    
    func deselectRow() {
        selectedImageView.isHidden = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
