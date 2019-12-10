//
//  CVHomeModel.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 07/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import Foundation

struct HomeSections: Equatable {
    
    let image: String
    let title: String
    
    static func == (lhs: HomeSections, rhs: HomeSections) -> Bool {
        if lhs.image == rhs.image && lhs.title == rhs.title {
            return true
        } else {
            return false
        }
    }
    
}
