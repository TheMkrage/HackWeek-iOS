//
//  ViewController.swift
//  morontest
//
//  Created by Matthew Krager on 10/31/18.
//  Copyright © 2018 Matthew Krager. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    var numPressed:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numPressed = 0
    }

    @IBAction func pressed(_ sender: Any) {
        numPressed = numPressed + 1
        if numPressed == 5 {
            performSegue(withIdentifier: "toNext", sender: nil)
        }
    }
    
}

