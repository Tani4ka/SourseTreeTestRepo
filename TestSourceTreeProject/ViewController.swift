//
//  ViewController.swift
//  TestSourceTreeProject
//
//  Created by Tetiana Hranchenko on 5/26/19.
//  Copyright © 2019 Canux Corporation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("viewWillApear")
    }
}

