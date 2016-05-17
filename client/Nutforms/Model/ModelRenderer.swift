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

    var model: Model?
    
    func bind(model: Model) {
        self.model = model
    }

    func render(view: UIView) {
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
            
            self.createWidget(view, attribute: attribute!, layoutManager: layoutManager)
        }
        
        // Create submit button
        self.createSubmitButton(view, model: self.model!, layoutManager: layoutManager)
    }
    
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
    
    func createWidget(view: UIView, attribute: Attribute, layoutManager: LayoutManager) {
        
        // Create label
        let label = UILabel(frame: CGRect(x: 20, y: CGFloat(layoutManager.verticalPosition), width: view.frame.width-40, height: CGFloat(layoutManager.labelHeight)))
        label.textAlignment = NSTextAlignment.Left
        label.text = attribute.localization.label
        view.addSubview(label)
        
        // Increment vertical position
        layoutManager.incrementVerticalPosition(layoutManager.labelHeight + layoutManager.labelToFieldSpacing);
        
        if (attribute.primary) {
            
            // Readonly widget
            let label = UILabel(frame: CGRect(x: 20, y: CGFloat(layoutManager.verticalPosition), width: view.frame.width-40, height: CGFloat(layoutManager.labelHeight)))
            label.textAlignment = NSTextAlignment.Left
            if (attribute.value != nil) {
                label.text = attribute.value
            } else {
                label.text = "N/A"
                label.textColor = UIColor.grayColor()
            }
            view.addSubview(label)
            layoutManager.incrementVerticalPosition(layoutManager.labelHeight + layoutManager.fieldToNextFieldSpacing);
            
        } else {
            
            // Textfield widgets
            switch attribute.type {
            case "java.lang.String":
                let myTextField = UITextField(frame: CGRect(x: 20, y: CGFloat(layoutManager.verticalPosition), width: view.frame.width-40, height: 40.00))
                myTextField.placeholder = ""
                myTextField.text = attribute.value
                myTextField.borderStyle = UITextBorderStyle.RoundedRect
                myTextField.secureTextEntry = false
                
                view.addSubview(myTextField)
                
                layoutManager.incrementVerticalPosition(Int(myTextField.frame.size.height) + layoutManager.fieldToNextFieldSpacing)
                break
                
            case "java.lang.Long":
                let myTextField = UITextField(frame: CGRect(x: 20, y: CGFloat(layoutManager.verticalPosition), width: view.frame.width-40, height: 40.00))
                myTextField.placeholder = ""
                myTextField.text = attribute.value
                myTextField.borderStyle = UITextBorderStyle.RoundedRect
                myTextField.secureTextEntry = false
                myTextField.keyboardType = UIKeyboardType.DecimalPad
                
                
                view.addSubview(myTextField)
                
                layoutManager.incrementVerticalPosition(Int(myTextField.frame.size.height) + layoutManager.fieldToNextFieldSpacing)
                break
                
            default:
                break
                
            }
            
        }
    }

}
