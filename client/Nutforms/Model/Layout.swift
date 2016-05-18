//
//  Layout.swift
//  client
//
//  Created by Filip Klimeš on 10/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

/// Layout for the Model form
class Layout {
    
    var betweenFieldsSpacing: Int
    var labelToFieldSpacing: Int
    var order: [Int: String]
    var model: Model?
    
    /**
     Initializes Layout instance.
     
     - parameter betweenFieldsSpacing: Spacing between fields of the form.
     - parameter labelToFieldSpacing:  Spacing between label and field.
     - parameter order:                Order of fields.
     
     - returns: Initialized Layout instance.
     */
    init(betweenFieldsSpacing: Int, labelToFieldSpacing: Int, order: [Int: String]) {
        self.betweenFieldsSpacing = betweenFieldsSpacing
        self.labelToFieldSpacing = labelToFieldSpacing
        self.order = order
    }
    
    /**
     Binds to instance of Model.
     
     - parameter model: The Model instance to bind to.
     */
    func bind(model: Model) {
        self.model = model
    }
    
}
