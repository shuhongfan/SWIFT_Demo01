//
//  SettingViewController.swift
//  Swift2048
//
//  Created by 光 on 15/12/18.
//  Copyright © 2015年 itcast. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController,UITextFieldDelegate {

    var mainview = MainViewController()

    var txtNum:UITextField!
    
    var segDimension:UISegmentedControl!
    
    init(mainview: MainViewController) {
        self.mainview = mainview
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置背景图片
        self.view.backgroundColor = UIColor(patternImage:UIImage(named: "backgroud")!)
//        self.view.backgroundColor = UIColor.whiteColor()
        
        self.setupControls()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupControls()
    {
        //创建文本输入框
//        txtNum = ControlView.createTextField("\(mainview.maxNumber)",action:Selector("numChanged"), sender:self)
        txtNum = ControlView.createTextField("\(mainview.maxNumber)",action:Selector(("numChanged")), sender:self)
        txtNum.frame = CGRect(x:90,y:100,width:255,height:30)
        txtNum.returnKeyType = UIReturnKeyType.done
        self.view.addSubview(txtNum)
        
        let labelNum = ControlView.createLabel("阈值:")
        labelNum.frame = CGRect(x: 30, y: 100, width: 60, height: 30)
        self.view.addSubview(labelNum)
        
        //创建分段单选控件
//        segDimension = ControlView.createSegment(["3x3", "4x4", "5x5"], action:"dimensionChanged:", sender:self)
        segDimension = ControlView.createSegment(["3x3", "4x4", "5x5"], action:#selector(SettingViewController.dimensionChanged(_:)), sender:self)
        segDimension.frame = CGRect(x:90,y: 150,width: 255,height: 30)
        segDimension.tintColor = UIColor.orange()
        segDimension.selectedSegmentIndex = 1
        self.view.addSubview(segDimension)
        
        
        let labelDm = ControlView.createLabel("维度:")
        labelDm.frame = CGRect(x: 30, y: 150, width: 60, height: 30)
        self.view.addSubview(labelDm)
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool
    {
        textField.resignFirstResponder()
        print("num Changed!")
        if(textField.text != "\(mainview.maxNumber)")
        {
            let num = Int(textField.text!)
            mainview.maxNumber = num!
        }
        return true
    }
    
    
    func dimensionChanged(_ sender:SettingViewController)
    {
        var segVals = [3,4,5]
        mainview.dimension  = segVals[segDimension.selectedSegmentIndex]
        mainview.reStart()
        
    }

}
