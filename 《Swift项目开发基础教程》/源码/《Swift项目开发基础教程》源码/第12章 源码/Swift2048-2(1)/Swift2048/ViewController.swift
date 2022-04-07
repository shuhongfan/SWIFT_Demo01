//
//  ViewController.swift
//  Swift2048
//
//  Created by 光 on 15/12/18.
//  Copyright © 2015年 itcast. All rights reserved.
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

    @IBAction func startGame(_ sender: UIButton) {
        // 弹出提示框
        let alertVc = UIAlertController(title: "开始！", message: "游戏就要开始，你准备好了吗？", preferredStyle: UIAlertControllerStyle.alert)
        let startAction = UIAlertAction(title: "Ready Go!", style: UIAlertActionStyle.default) {
            (action: UIAlertAction!) -> Void in
            // modal出标签控制器
            self.present(MainTabBarViewController(), animated: true, completion: nil)
        }
        alertVc.addAction(startAction)
        self.present(alertVc, animated: true, completion: nil)
    }
}

