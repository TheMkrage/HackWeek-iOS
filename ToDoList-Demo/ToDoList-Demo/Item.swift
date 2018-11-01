//
//  Item.swift
//  ToDoList-Demo
//
//  Created by Matthew Krager on 10/30/18.
//  Copyright © 2018 Matthew Krager. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name: String
    var isMarked = false
    
    init(name: String) {
        self.name = name
    }
}
