//
//  ScoreView.swift
//  Swift2048
//
//  Created by 光 on 15/12/25.
//  Copyright © 2015年 itcast. All rights reserved.
//

import UIKit
// 让分数和最高分视图共享一个接口
protocol ScoreViewProtocol
{
    func changeScore(value s:Int)
}

class ScoreView: UIView,ScoreViewProtocol {
    var label:UILabel
    let defaultFrame = CGRect(x: 0, y: 0, width: 162, height: 30)
    
    var score:Int = 0{
        didSet{
            label.text = "   分    数：  \(score)"
        }
    }
    
    init()
    {
        label = UILabel(frame: defaultFrame)
        label.textAlignment = NSTextAlignment.left
        
        label.layer.borderColor = UIColor(red: 254.0/255.0, green: 204.0/255.0, blue: 57.0/255.0, alpha: 1.0).cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 15
        label.layer.masksToBounds = true
        label.backgroundColor = UIColor.white()
        
        // 设置背景图片
        label.font = UIFont.systemFont(ofSize: 12)
        
        //当文字超出标签宽度时，自动调整文字大小，使其不被截断
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.black()
        
        super.init(frame: defaultFrame)
        
        self.addSubview(label)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeScore(value s:Int)
    {
        score = s
    }
}
class BestScoreView:ScoreView{
    var bestScore:Int = 0{
        didSet{
            let theBestScore = Int(UserDefaults.standard().value(forKey: "BestScore") as! NSNumber)
            if theBestScore > bestScore{
                label.text = "   最高分：  \(theBestScore)"
            }
            label.text = "   最高分：  \(bestScore)"
        }
    }
    
    override func changeScore(value s: Int) {
        let theBestScore = Int(UserDefaults.standard().value(forKey: "BestScore") as! NSNumber)
        if theBestScore == 0{
            bestScore = s
        }
        bestScore = theBestScore
    }
}
