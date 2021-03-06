//
//  Observer.swift
//  client
//
//  Created by Filip Klimeš on 16/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

protocol Observer {

    /**
     Updates the Observer about event represented by Action object.

     - parameter action: The Action object.
     */
    func update(action: Action)

}
