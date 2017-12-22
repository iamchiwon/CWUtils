//
//  ViewController.swift
//  Example
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import UIKit
import CWUtils

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let currentTimInMilli: Int = Date.currentTimeInMilli()
        print(currentTimInMilli)

        let timeInMillie: Int = Date().timeInMilli()
        print(timeInMillie)

        let today: String = Date().formatted("YYYY-MM-dd")
        print(today)

        
    }
}

