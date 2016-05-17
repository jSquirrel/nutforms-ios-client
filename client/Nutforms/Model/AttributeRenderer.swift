//
//  AttributeRenderer.swift
//  client
//
//  Created by Filip Klimeš on 17/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation
import UIKit

class AttributeRenderer {
    
    var attribute: Attribute?
    
    func bind(attribute: Attribute) {
        self.attribute = attribute
    }

    func render(view: UIView, layoutManager: LayoutManager) {
        // Create label
        let label = UILabel(frame: CGRect(x: 20, y: CGFloat(layoutManager.verticalPosition), width: view.frame.width-40, height: CGFloat(layoutManager.labelHeight)))
        label.textAlignment = NSTextAlignment.Left
        label.text = self.attribute!.localization.label
        view.addSubview(label)
        
        // Increment vertical position
        layoutManager.incrementVerticalPosition(layoutManager.labelHeight + layoutManager.labelToFieldSpacing);
        
        let widgetName = attribute!.model!.widgetMapping(attribute!)
        let widgetData = attribute!.model!.aspectsSource!.fetchWidget(widgetName)
        
        // TODO: register for events
        
        switch widgetData["type"]! {
            case "label":
                let label = UILabel(frame: CGRect(x: 20, y: CGFloat(layoutManager.verticalPosition), width: view.frame.width-40, height: CGFloat(layoutManager.labelHeight)))
                label.textAlignment = NSTextAlignment.Left
                if (attribute!.value != nil) {
                    label.text = attribute!.value
                } else {
                    label.text = "N/A"
                    label.textColor = UIColor.grayColor()
                }
                view.addSubview(label)
                layoutManager.incrementVerticalPosition(layoutManager.labelHeight + layoutManager.fieldToNextFieldSpacing);
                break
            
            case "UITextField":
                let myTextField = UITextField(frame: CGRect(x: 20, y: CGFloat(layoutManager.verticalPosition), width: view.frame.width-40, height: 40.00))
                myTextField.placeholder = ""
                myTextField.text = attribute!.value
                myTextField.secureTextEntry = false
                
                if widgetData["border_style"] != nil {
                    switch widgetData["border_style"]! {
                    case "UITextBorderStyle.RoundedRect":
                        myTextField.borderStyle = UITextBorderStyle.RoundedRect
                        break
                    // TODO: implement more options
                    default:
                        break
                    }
                }
                
                if widgetData["keyboard_type"] != nil {
                    switch widgetData["keyboard_type"]! {
                    case "UIKeyboardType.DecimalPad":
                        myTextField.keyboardType = UIKeyboardType.DecimalPad
                        break
                    // TODO: implement more options
                    default:
                        break
                    }
                }
                
                // TODO: implement more options
                
                myTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingChanged)
                
                view.addSubview(myTextField)
                layoutManager.incrementVerticalPosition(Int(myTextField.frame.size.height) + layoutManager.fieldToNextFieldSpacing)
                break
                
            default:
                break
        }
    }

    @objc func textFieldDidChange(textField: UITextField) {
        attribute!.setValue(textField.text)
    }

}
