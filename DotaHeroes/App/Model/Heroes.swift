//
//  Heroes.swift
//  DotaHeroes
//
//  Created by Agus Cahyono on 04/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import Foundation

// MARK: - Hero
struct Hero: Codable {
    var id: Int?
    var name, localizedName, primaryAttr, attackType: String?
    var roles: [String]?
    var img, icon: String?
    var attackRange, projectileSpeed: Int?
    var attackRate: Double?
    var moveSpeed: Int?
    var turnRate: Double?
    var cmEnabled: Bool?
    var legs, proBan, heroID: Int?

    enum CodingKeys: String, CodingKey {
        case id, name
        case localizedName = "localized_name"
        case primaryAttr = "primary_attr"
        case attackType = "attack_type"
        case roles, img, icon
        case attackRange = "attack_range"
        case projectileSpeed = "projectile_speed"
        case attackRate = "attack_rate"
        case moveSpeed = "move_speed"
        case turnRate = "turn_rate"
        case cmEnabled = "cm_enabled"
    }
}

typealias Heroes = [Hero]
