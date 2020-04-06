//
//  Array+Extensions.swift
//  DotaHeroes
//
//  Created by Agus Cahyono on 04/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import Foundation

extension Array where Element:Equatable {
    func removeDuplicates() -> [Element] {
        var result = [Element]()
        
        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }
        
        return result
    }
}

extension Array where Element: Comparable {
    func containsSameElements(as other: [Element]) -> Bool {
        return self.count == other.count && self.sorted() == other.sorted()
    }
}
