//
//  ModelRenderer.swift
//  client
//
//  Created by Filip Klimeš on 10/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation
import UIKit

class ModelRenderer {

    /// Model to which the Renderer belongs
    var model: Model?
    
    /**
     Binds to Model instance.
     
     - parameter model: Model instance to bind to.
     */
    func bind(model: Model) {
        self.model = model
    }

    /**
     Renders the form.
     
     - parameter view: View to bind the form to.
     */
    func render(view: UIView) {
        // TODO: move stuff to attribute renderer
        
        let layoutManager = LayoutManager(
            labelToFieldSpacing: self.model!.layout.labelToFieldSpacing,
            betweenFieldsSpacing: self.model!.layout.betweenFieldsSpacing
        )

        // Create form label
        self.createFormLabel(view, model: self.model!, layoutManager: layoutManager)
        
        // Sort by layout order
        let sortedKeys = Array(self.model!.layout.order.keys).sort(<)
        // Create widgets
        for key in sortedKeys {
            let attributeName = self.model!.layout.order[key]
            var attribute = self.model!.attributes[attributeName!]
            if (attribute == nil) {
                attribute = self.model!.relations[attributeName!]
            }
            if (attribute == nil) {
                continue
            }
            
            attribute!.renderer.render(view, layoutManager: layoutManager)
        }
        
        // Create submit button
        self.createSubmitButton(view, model: self.model!, layoutManager: layoutManager)
    }
    
    /**
     Creates form label.
     
     - parameter view:          View to bind the label to.
     - parameter model:         Instance of Model.
     - parameter layoutManager: Instance of Layout Manager.
     */
    func createFormLabel(view: UIView, model: Model, layoutManager: LayoutManager) {
        let label = UILabel(
            frame: CGRect(
                x: 25,
                y: CGFloat(layoutManager.verticalPosition),
                width: view.frame.width-40,
                height: CGFloat(layoutManager.labelHeight)
            )
        )
        label.textAlignment = NSTextAlignment.Center
        label.text = model.localization.formLabel
        view.addSubview(label)
        // Increment vertical position
        layoutManager.incrementVerticalPosition(layoutManager.labelHeight + layoutManager.formLabelSpacing);
    }
    
    /**
     Creates Submit Button for the form.
     
     - parameter view:          View to bind the submit button to.
     - parameter model:         Instance of Model.
     - parameter layoutManager: Instance of LayoutManager.
     */
    func createSubmitButton(view: UIView, model: Model, layoutManager: LayoutManager) {
        let button=UIButton(
            frame: CGRectMake(
                20,
                CGFloat(layoutManager.verticalPosition),
                view.frame.width-40,
                40
            )
        )
        button.setTitle(model.localization.submitButtonLabel, forState: .Normal)
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)
        button.titleLabel!.textAlignment=NSTextAlignment.Center
        view.addSubview(button)
    }

}
