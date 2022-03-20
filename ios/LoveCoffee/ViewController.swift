//
//  ViewController.swift
//  LoveCoffee
//
//  Created by Isaac Ramirez on 20/03/22.
//

import React
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sayTQ(sender: UIButton) {
        let alertController = UIAlertController(
            title: "Te quiero!",
            message: "😘",
            preferredStyle: UIAlertController.Style.alert
        )
        
        alertController.addAction(UIAlertAction(
            title: "Close",
            style: UIAlertAction.Style.default,
            handler: nil
        ))
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func showRNView(sender: UIButton) {
        NSLog("Loading React Native view")
        
        let vc = UIViewController()
        if let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios") {
            let rootView = RCTRootView(
                bundleURL: jsCodeLocation,
                moduleName: "LoveCoffeeRN",
                initialProperties: nil,
                launchOptions: nil
            )
            vc.view = rootView
        }
        
        self.present(vc, animated: true, completion: nil)
    }

}

