//
//  ViewController.swift
//  TestSourceTreeProject
//
//  Created by Tetiana Hranchenko on 5/26/19.
//  Copyright © 2019 Canux Corporation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func alertAction(_ sender: Any) {
        
        let showAlert = { [weak self] in
            
            let alertController = UIAlertController(title: "Hey AppCoda", message: "Whatdoyou want to do", preferredStyle: .alert)
            
            let handler = { (action: UIAlertAction) -> Void in print("\(String(describing: action.title))")
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: handler)
            alertController.addAction(cancelAction)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: { action in print("\(String(describing: action.title))") })
            alertController.addAction(okAction)
            
            let defaultAction = UIAlertAction(title: "Default", style: .default, handler: handler)
            alertController.addAction(defaultAction)
            
            let destructiveAction = UIAlertAction(title: "Destructive", style: .destructive, handler: handler)
            alertController.addAction(destructiveAction)
            
            self?.present(alertController, animated: true) { print("Alert") }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: showAlert)
    }
    
    @IBAction func sheetAlertAction(_ sender: Any) {
        
        let showAlert = { [weak self] in
            
            let alertController = UIAlertController(title: "Hey AppCoda", message: "Whatdoyou want to do", preferredStyle: .actionSheet)
            
            let handler = { (action: UIAlertAction) -> Void in print("\(String(describing: action.title))")
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: handler)
            alertController.addAction(cancelAction)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: { action in print("\(String(describing: action.title))") })
            alertController.addAction(okAction)
            
            let defaultAction = UIAlertAction(title: "Default", style: .default, handler: handler)
            alertController.addAction(defaultAction)
            
            let destructiveAction = UIAlertAction(title: "Destructive", style: .destructive, handler: handler)
            alertController.addAction(destructiveAction)
            
            self?.present(alertController, animated: true) { print("Alert sheet") }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: showAlert)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad in master")
        print("Hello world")
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewWillApear")
    }
}

