//
//  ViewController.swift
//  client
//
//  Created by Filip Klimeš on 10/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.whiteColor()
        
        // Use Nutforms to automatically generate form
        let nutforms = Nutforms(aspectsSource: FakeAspectsSource())
        nutforms.generateForm(
            self.view,
            entityName: "cz.cvut.fel.nutforms.example.model.Bug",
            locale: "en_US",
            entityId: 1,
            layout: "common/basic",
            widgetMapping: {(Attribute) -> String in return "text-field"},
            context: "edit"
        )
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
