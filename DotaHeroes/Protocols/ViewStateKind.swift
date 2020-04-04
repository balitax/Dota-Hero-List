//
//  ViewStateKind.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation

enum ViewStateKind {
    case initial
    case empty
    case success
    case error(description: String)
}
