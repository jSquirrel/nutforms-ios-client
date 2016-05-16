//
//  Layout.swift
//  client
//
//  Created by Filip Klimeš on 10/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

class Layout {
    
    var betweenFieldsSpacing: Int
    var labelToFieldSpacing: Int
    var order: [Int: String]
    var model: Model?
    
    init(betweenFieldsSpacing: Int, labelToFieldSpacing: Int, order: [Int: String]) {
        self.betweenFieldsSpacing = betweenFieldsSpacing
        self.labelToFieldSpacing = labelToFieldSpacing
        self.order = order
    }
    
    func bind(model: Model) {
        self.model = model
    }
    
}
