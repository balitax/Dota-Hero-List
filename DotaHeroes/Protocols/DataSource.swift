//
//  DataSource.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

protocol DataSource: class {
    func numberOfSection() -> Int
    func numberOfRow(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> CellRepresentable
    func titleForHeader(in section: Int) -> String?
}

extension DataSource {
    func titleForHeader(in section: Int) -> String? {
        return ""
    }
}
