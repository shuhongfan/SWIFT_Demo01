//
//  GuideViewController.swift
//  Swift2048
//
//  Created by LKing on 15/12/30.
//  Copyright © 2015年 itcast. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController,UIScrollViewDelegate {
    var numPages = 4
    override func viewDidLoad() {
        let frame = self.view.bounds
        let scrollView = UIScrollView()
        scrollView.frame = self.view.bounds
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: frame.size.width * CGFloat(numPages), height: frame.size.height)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        for i in 0 ..< numPages{
            let imgfile = "welcome0\(Int(i + 1)).png"
            let image = UIImage(named: "\(imgfile)")
            let imgView = UIImageView(image: image)
            imgView.frame = CGRect(x: frame.size.width * CGFloat(i), y: CGFloat(0), width: frame.size.width, height: frame.size.height)
            scrollView.addSubview(imgView)
        }
        scrollView.contentOffset = CGPoint.zero
        self.view.addSubview(scrollView)
        }
    //ScrollerView的代理方法，视图滚动时就会触发
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        let twidth = CGFloat(numPages-1) * self.view.bounds.size.width
        // 当滚动视图滑动超过它的宽度时结束跳转到游戏界面
        if(scrollView.contentOffset.x > twidth)
        {
            print("scrolled:\(scrollView.contentOffset)")
//            let mainStoryboard = UIStoryboard(name:"Main", bundle:nil)
//            let viewController = mainStoryboard.instantiateInitialViewController()! as UIViewController
            let viewController = MainTabBarViewController()
            self.present(viewController, animated: true, completion:nil)
        }
    }
}
