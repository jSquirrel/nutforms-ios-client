//
//  LayoutManager.swift
//  client
//
//  Created by Filip Klimeš on 10/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

class LayoutManager {
    
    var verticalPosition: Int
    var labelHeight: Int
    var labelToFieldSpacing: Int
    var fieldToNextFieldSpacing: Int
    var formLabelSpacing: Int

    init(verticalPosition: Int, labelHeight: Int, labelToFieldSpacing: Int, betweenFieldsSpacing: Int, formLabelSpacing: Int) {
        self.verticalPosition = verticalPosition
        self.labelHeight = labelHeight
        self.labelToFieldSpacing = labelToFieldSpacing
        self.fieldToNextFieldSpacing = betweenFieldsSpacing
        self.formLabelSpacing = formLabelSpacing
    }
    convenience init(labelToFieldSpacing: Int, betweenFieldsSpacing: Int) {
        self.init(verticalPosition: 35, labelHeight: 20, labelToFieldSpacing: labelToFieldSpacing, betweenFieldsSpacing: betweenFieldsSpacing, formLabelSpacing: 30)
    }
    
    func incrementVerticalPosition(value : Int) {
        verticalPosition += value;
    }

}
