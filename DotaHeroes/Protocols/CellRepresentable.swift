//
//  CellRepresentable.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

protocol CellRepresentable {
    var type: String { get }
    var rowHeight: CGFloat { get }
    var estimatedRowHeight: CGFloat { get }
    var accessoryType: UITableViewCell.AccessoryType { get }
}

extension CellRepresentable {
    var rowHeight: CGFloat  {
        return UITableView.automaticDimension
    }
    
    var estimatedRowHeight: CGFloat {
        return UITableView.automaticDimension
    }
    
    var accessoryType: UITableViewCell.AccessoryType {
        return .none
    }
}
