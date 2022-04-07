//
//  ControlView.swift
//  Swift2048
//
//  Created by 光 on 15/12/23.
//  Copyright © 2015年 itcast. All rights reserved.
//

import UIKit

class ControlView {
    
    // 创建按钮,title表示标题，action表示事件，sender表示事件的触发者
    class func createButton(_ action:Selector, sender:UIViewController) -> UIButton
    {
        let button = UIButton()
//        button.backgroundColor = UIColor.orangeColor()
        button.setBackgroundImage(UIImage(named: "retry"), for: UIControlState())
        button.setBackgroundImage(UIImage(named: "retry-highlighted"), for: UIControlState.highlighted)
        button.addTarget(sender, action: action, for: UIControlEvents.touchUpInside)
        button.layer.cornerRadius = 16;
        return button
    }
    
    class func createTextField(_ value:String, action:Selector, sender:UITextFieldDelegate) -> UITextField
    {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white()
        
        textField.layer.borderWidth=1
        textField.layer.cornerRadius = 15
        textField.layer.masksToBounds = true
        textField.layer.borderColor = UIColor(red: 254.0/255.0, green: 204.0/255.0, blue: 57.0/255.0, alpha: 1.0).cgColor
        
        textField.textColor = UIColor.black()
        textField.text = value

        textField.adjustsFontSizeToFitWidth = true
        textField.delegate = sender
        
        return textField
    }
    
    class func createSegment(_ items: [String], action:Selector, sender:UIViewController) ->UISegmentedControl
    {
        let segment = UISegmentedControl(items:items)
        segment.isMomentary = false
        segment.addTarget(sender, action:action, for:UIControlEvents.valueChanged)
        
        return segment
    }
    
    class func createLabel(_ title:String) -> UILabel
    {
        let label = UILabel()
        label.textColor = UIColor.black();
//        label.backgroundColor = UIColor.whiteColor();
        label.text = title;
        label.font =  UIFont(name: "HelveticaNeue-Bold", size: 16)
        return label
    }
    
//    class func createImageView(name:String) -> UIImageView
//    {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: name)
//        return imageView
//    }
    
}
