//
//  ViewController.swift
//  MainModule
//
//  Created by apple on 16/3/4.
//  Copyright © 2016年 itcast. All rights reserved.
//

import UIKit
import AnotherTarget

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let dog = AnotherTarget.Dog()
        dog.shout()
        let dog2 = Dog()
        dog2.shout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

