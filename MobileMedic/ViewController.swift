//
//  ViewController.swift
//  MobileMedic
//
//  Created by Tadej Kostanjevec on 19/04/2017.
//  Copyright © 2017 Tadej Kostanjevec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // When protected page is loaded/created this line of code will present user with login view
    override func viewDidAppear(_ animated: Bool) {
        self.performSegue(withIdentifier: "loginView", sender: self);
    }
}

