//
//  MainTabBarViewController.swift
//  Swift2048
//
//  Created by 光 on 15/12/18.
//  Copyright © 2015年 itcast. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    init(){
        super.init(nibName: nil, bundle: nil)
        
//        self.view.backgroundColor = UIColor.grayColor()
        let mainVC = MainViewController()
        mainVC.title = "游戏"
        mainVC.tabBarItem.image = UIImage(named: "game")
        
        let settingVC = SettingViewController(mainview: mainVC)
        settingVC.title = "设置"
        settingVC.tabBarItem.image = UIImage(named: "set")
        
        let main = UINavigationController(rootViewController: mainVC)
        let setting = UINavigationController(rootViewController: settingVC)
        
        self.viewControllers = [main, setting]
        self.tabBar.tintColor = UIColor.orange()

//        self.selectedIndex = 0  // 该行代码多余
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
