//
//  TileView.swift
//  Swift2048
//
//  Created by 光 on 15/12/21.
//  Copyright © 2015年 itcast. All rights reserved.
//

import UIKit

class TileView: UIView {
    // 颜色
    let colorMap = [
        2:UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 75.0/255.0, alpha: 1.0),
        4:UIColor(red: 190.0/255.0, green: 235.0/255.0, blue: 50.0/255.0, alpha: 1.0),
        8:UIColor(red: 95.0/255.0, green: 235.0/255.0, blue: 100.0/255.0, alpha: 1.0),
        16:UIColor(red: 0.0/255.0, green: 235.0/255.0, blue: 200.0/255.0, alpha: 1.0),
        32:UIColor(red: 70.0/255.0, green: 200.0/255.0, blue: 250.0/255.0, alpha: 1.0),
        64:UIColor(red: 70.0/255.0, green: 165.0/255.0, blue: 250.0/255.0, alpha: 1.0),
        128:UIColor(red: 180.0/255.0, green: 110.0/255.0, blue: 255.0/255.0, alpha: 1.0),
        256:UIColor(red: 235.0/255.0, green: 95.0/255.0, blue: 250.0/255.0, alpha: 1.0),
        512:UIColor(red: 240.0/255.0, green: 90.0/255.0, blue: 155.0/255.0, alpha: 1.0),
        1024:UIColor(red: 235.0/255.0, green: 70.0/255.0, blue: 75.0/255.0, alpha: 1.0),
        2048:UIColor(red: 255.0/255.0, green: 135.0/255.0, blue: 50.0/255.0, alpha: 1.0)
    ]
    
    // 监测颜色和文字的变化
    var value : Int = 0{
        didSet{
            backgroundColor = colorMap[value]
            numberLabel.text = "\(value)"
        }
    }
    
    // 标签
    var numberLabel:UILabel
    
    
    init(pos:CGPoint, width:CGFloat, value:Int){
        numberLabel = UILabel(frame:CGRect(x: 0, y: 0, width: width, height: width))
        numberLabel.textAlignment = NSTextAlignment.center
        numberLabel.minimumScaleFactor = 0.5
        numberLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        numberLabel.text = "\(value)"
        
        super.init(frame: CGRect(x: pos.x, y: pos.y, width: width, height: width))
        addSubview(numberLabel)
        self.value = value
        backgroundColor = colorMap[value]
        
        switch value{
        case 2,4:
            numberLabel.textColor = UIColor(red: 119.0/255.0, green: 110.0/255.0, blue: 101.0/255.0, alpha: 1.0)
            break
        default:
            numberLabel.textColor = UIColor.white()
            break
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
