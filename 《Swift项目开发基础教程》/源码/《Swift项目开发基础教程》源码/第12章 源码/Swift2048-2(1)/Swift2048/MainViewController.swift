//
//  MainViewController.swift
//  Swift2048
//
//  Created by 光 on 15/12/18.
//  Copyright © 2015年 itcast. All rights reserved.
//

import UIKit

enum AnimationSlipType
{
    case none // 无动画
    case new  // 新出现动画
    case merge// 合并动画
}

class MainViewController: UIViewController {
    // 图像视图
    var whiteView : UIView
    var imageView : UIImageView
    var reTryButton : UIButton
    
    // 游戏方格维度
    var dimension : Int = 4{
        didSet{
            gameModel.dimension = dimension
        }
    }
    // 游戏过关最大值
    var maxNumber : Int = 2048{
        didSet{
            gameModel.maxNumber = maxNumber
        }
    }
    
    // 数字格子的宽度
    var width : CGFloat = 58
    // 格子与格子的间隙
    var padding : CGFloat = 7
    
    // 保存背景图数据
    var backgrounds:Array<UIView>
    
    // 游戏数据模型
    var gameModel:GameModel!
    
    // 保存界面的数字标签
    var tiles:Dictionary<IndexPath, TileView>
    // 保存实际数字值的字典
    var tileVals:Dictionary<IndexPath, Int>
    
    // 分数标签
    var score:ScoreView
    // 最高分标签
    var bestScore:BestScoreView
    
    init() {
        self.reTryButton = UIButton()
        self.imageView = UIImageView()
        self.whiteView = UIView()
        self.backgrounds = Array<UIView>()
        self.tiles = Dictionary()
        self.tileVals = Dictionary()
        self.score = ScoreView()
        self.bestScore = BestScoreView()
        super.init(nibName: nil, bundle: nil)
    }
    
    // 必须实现的方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置背景颜色
        self.view.backgroundColor = UIColor(patternImage:UIImage(named: "backgroud")!)
        
//        self.view.backgroundColor = UIColor.purpleColor()
        
        // 设置游戏名称图片
        setupTitleView()
        
        // 设置重新开始按钮
        setupReTryBtn()
        
        // 设置背景九宫格图片
        setupBackground()
        
//        // 生成控制按钮
//        setupButtons()
        
        // 添加手势
        setupSwipeGuestures()
        
        // 添加分数和最高分标签
        setupScoreLabels()
        
        self.gameModel = GameModel(dimension: self.dimension, maxnumber:maxNumber, score:score, bestScore:bestScore)
        
        // 动画地生成随机标签
        for _ in 0..<2
        {
            genRandom()
        }
    }
    
    // 添加2048图片
    func setupTitleView()
    {
        // 设置2048的名称
        imageView.image = UIImage(named: "title")
        imageView.frame = CGRect(x: 22, y: 96, width: 89, height: 69)
        self.view.addSubview(self.imageView)
    }
    
    func setupReTryBtn()
    {
        reTryButton = ControlView.createButton(#selector(MainViewController.reStart), sender: self)
        reTryButton.frame = CGRect(x: 290, y: 96, width: 61, height: 69)
        self.view.addSubview(reTryButton)
        
    }
    
    func reStart()
    {
        resetUI()
        // 同步数据
        gameModel.initTiles()
        for _ in 0 ..< 2{
            genRandom()
        }
    }
    
    func setupWhiteView()
    {
        let rect = UIScreen.main().bounds
        let w:CGFloat = rect.width
        
        // 白块的坐标和尺寸
        let backWidth = width*CGFloat(dimension) + padding * CGFloat (dimension - 1) + 20
        let backX = (w - backWidth) / 2
        
        // 添加白色方块
        self.whiteView.frame = CGRect(x:backX, y: 208, width: backWidth, height: backWidth)
        self.whiteView.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.6)
        self.view.addSubview(self.whiteView)
    }
    
    func setupBackground()
    {
        // 设置白色地图背景
        setupWhiteView()
        
        //根据屏幕尺寸计算插入的位置
        var x:CGFloat = 10
        var y:CGFloat = 10
        
        // 竖行逐一排列
        for _ in 0..<dimension{
            y = 10 // 重置Y值
            for _ in 0..<dimension {
                // 添加九宫格背景
                let backgroundView = UIView(frame: CGRect(x: x, y: y, width: width, height: width))
                backgroundView.backgroundColor = UIColor(red: 210.0/255.0, green: 210.0/255.0, blue: 210.0/255.0, alpha: 1.0)
                backgroundView.layer.cornerRadius = 4
                self.whiteView.addSubview(backgroundView)
                backgrounds.append(backgroundView)
                y += padding + width
            }
            x += padding + width
        }
    }
    
    // 随机生成数字
    func genRandom() {
        // 生成一个随机数
        let radomNum = Int(arc4random_uniform(10))

        // 以9：1的比例显示数字2和4
        var seed:Int = 2
        if radomNum == 1 {
            seed = 4
        }
        
        // 根据维度来确定数字显示的位置
        let col = Int(arc4random_uniform(UInt32(dimension)))
        let row = Int(arc4random_uniform(UInt32(dimension)))
        
        // 如果位置满了，直接返回
        if gameModel.isFull()
        {
            return
        }
        if gameModel.setPosition(row, col: col, value: seed) == false
        {
            genRandom()
            return
        }
        
        if gameModel.isFailure() == true
        {
            let alertVc = UIAlertController(title: "游戏结束！", message: "抱歉！！您失败了！！！", preferredStyle: UIAlertControllerStyle.alert)
            let reTry = UIAlertAction(title: "再试一次", style: UIAlertActionStyle.default) {
                (action: UIAlertAction!) -> Void in
                self.reStart()
            }
            alertVc.addAction(reTry)
            self.present(alertVc, animated: true, completion: nil)
            
        }
        
        insertTitle((row, col), value:seed, aType: AnimationSlipType.new)
    }
    
    // 插入数字
    func insertTitle(_ pos:(Int, Int), value:Int, aType:AnimationSlipType) {
        let (row, col) = pos
        
        //根据屏幕尺寸计算插入的位置
//        let rect = UIScreen.mainScreen().bounds
//        let w:CGFloat = rect.width
//        let a:CGFloat = (w - (width*CGFloat(dimension)) - (padding * CGFloat (dimension - 1))) / 2
        
        let x = 10 + CGFloat(col) * (width + padding)
        let y = 10 + CGFloat(row) * (width + padding)
        let tile = TileView(pos: CGPoint(x: x, y: y), width: width, value: value)
        tile.layer.cornerRadius = 4
        self.whiteView.addSubview(tile)
        self.view.bringSubview(toFront: tile)
        
        // 将tile保存到字典
        let index = IndexPath(row: row, section: col)  // key
        tiles[index] = tile                                   // value
        tileVals[index] = value
        
        // 动画展示数字
        if aType == AnimationSlipType.none
        {
            return
        }else if aType == AnimationSlipType.new
        {
            tile.layer.setAffineTransform(CGAffineTransform(scaleX: 0.1, y: 0.1))
        }else if aType == AnimationSlipType.merge
        {
            tile.layer.setAffineTransform(CGAffineTransform(scaleX: 0.8, y: 0.8))
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.1, options: UIViewAnimationOptions(), animations:
            {
                () -> Void in
                tile.layer.setAffineTransform(CGAffineTransform(scaleX: 1, y: 1))
            },
            completion:{
                (finished:Bool) -> Void in
                UIView.animate(withDuration: 0.08, animations: {
                    () -> Void in
                    tile.layer.setAffineTransform(CGAffineTransform.identity)
                })
            })
    }
    
    // 添加分数标签
    func setupScoreLabels()
    {
        // 添加分数
//        score = ScoreView()
        score.frame.origin.x = 119
        score.frame.origin.y = 96
        bestScore.sizeToFit()
        score.changeScore(value: 0)
        
//        score.backgroundColor = UIColor.redColor()
        self.view.addSubview(score)
        
        // 添加最高分
//        bestScore = BestScoreView()
        bestScore.frame.origin.x = 119
        bestScore.frame.origin.y = 136
        bestScore.sizeToFit()
        bestScore.changeScore(value: 0)
        self.view.addSubview(bestScore)
    }
    
    
    func resetTapped()
    {
        resetUI()
        // 同步数据
        gameModel.initTiles()
        for _ in 0 ..< 2{
            genRandom()
        }
    }
    
    func initUI()
    {
        var index:Int
        var key:IndexPath
        var tile:TileView
        var tileVal:Int

        
        for i in 0..<dimension
        {
            for j in 0..<dimension
            {
                index = i*self.dimension + j
                key = IndexPath(row: i, section: j)
                
                // 原来界面没有值，模型数据中有值
                if gameModel.tiles[index] > 0 && tileVals.index(forKey: key) == nil
                {
                    insertTitle((i,j), value: gameModel.tiles[index], aType: AnimationSlipType.merge)
                }
                
                // 原来界面中有值，现在模型数据中没有值
                if (gameModel.tiles[index] == 0) && (tileVals.index(forKey: key) != nil)
                {
                    tile = tiles[key]!
                    tile.removeFromSuperview()
                    tiles.removeValue(forKey: key)
                    tileVals.removeValue(forKey: key)
                }
                
                // 原来有值，现在仍然有值
                if (gameModel.tiles[index] > 0) && (tileVals.index(forKey: key) != nil)
                {
                    tileVal = tileVals[key]!
                    if tileVal != gameModel.tiles[index]
                    {
                        tile = tiles[key]!
                        tile.removeFromSuperview()
                        tiles.removeValue(forKey: key)
                        tileVals.removeValue(forKey: key)
                        insertTitle((i,j), value: gameModel.tiles[index], aType: AnimationSlipType.merge)
                    }
                }
            }
        }
        if gameModel.isSuccess()
        {
            // 弹出提示框
            let alertVc = UIAlertController(title: "恭喜过关！", message: "嘿，真棒！！您过关了！！！", preferredStyle: UIAlertControllerStyle.alert)
            let makeSure = UIAlertAction(title: "确定", style: UIAlertActionStyle.default) {
                (action: UIAlertAction!) -> Void in
                
            }
            let reTry = UIAlertAction(title: "再玩一次", style: UIAlertActionStyle.default) {
                (action: UIAlertAction!) -> Void in
                self.reStart()
            }
            
            alertVc.addAction(makeSure)
            alertVc.addAction(reTry)
            self.present(alertVc, animated: true, completion: nil)
            
            //在ios9.0以后使用UIAlertController代替UIAlertView
//            let alertView = UIAlertView()
//            alertView.title = "恭喜过关"
//            alertView.message = "嘿，真棒！！您过关了！！！"
//            alertView.addButtonWithTitle("确定")
//            alertView.show()
            return
        }
        
    }
    
    func resetUI()
    {
        for (_, tile) in tiles
        {
            tile.removeFromSuperview()
        }
        tiles.removeAll(keepingCapacity: true)
        tileVals.removeAll(keepingCapacity: true)
        
        for background in backgrounds{
            background.removeFromSuperview()
        }
        setupBackground()
        
        score.changeScore(value: 0)
        gameModel.score = 0
//        gameModel.initTiles()
    }
    
    func genTapped()
    {

        genRandom()
    }
    
    // 添加4个方向的轻扫手势
    func setupSwipeGuestures()
    {
        // 向上
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(MainViewController.swipeUp))
        upSwipe.numberOfTouchesRequired = 1
        upSwipe.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(upSwipe)
        
        // 向下
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(MainViewController.swipeDown))
        downSwipe.numberOfTouchesRequired = 1
        downSwipe.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(downSwipe)
        
        // 向左
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(MainViewController.swipeLeft))
        leftSwipe.numberOfTouchesRequired = 1
        leftSwipe.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(leftSwipe)
        
        // 向右
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(MainViewController.swipeRight))
        rightSwipe.numberOfTouchesRequired = 1
        rightSwipe.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(rightSwipe)
    }
    
    func swipeUp()
    {
        let tile: Array<Int> = gameModel.tiles
        
        if !gameModel.isSuccess()
        {
            gameModel.reflowUp()
            gameModel.mergeUp()
            gameModel.reflowUp()
            
            initUI()
            
            if tile != gameModel.mtiles{
                // 生成随机数字
                genRandom()
            }
        }
        
    }
    func swipeDown()
    {
        let tile: Array<Int> = gameModel.tiles
        
        if !gameModel.isSuccess()
        {
            gameModel.reflowDown()
            gameModel.mergeDown()
            gameModel.reflowDown()
            
            initUI()
            
            if tile != gameModel.mtiles{
                // 生成随机数字
                genRandom()
            }
        }
    }
    func swipeLeft()
    {
        let tile: Array<Int> = gameModel.tiles
        
//        printTiles(gameModel.tiles)
//        printTiles(gameModel.mtiles)
        
        // 重设界面
//        resetUI()
        
        if !gameModel.isSuccess()
        {
            gameModel.reflowLeft()
            gameModel.mergeLeft()
            gameModel.reflowLeft()
            
            // 重设界面
            initUI()

            if tile != gameModel.mtiles{
                // 生成随机数字
                genRandom()
            }
        }
    }
    func swipeRight()
    {
        let tile: Array<Int> = gameModel.tiles
//        printTiles(gameModel.tiles)
//        printTiles(gameModel.mtiles)
        
        
        if !gameModel.isSuccess()
        {
            gameModel.reflowRight()
            gameModel.mergeRight()
            gameModel.reflowRight()
            
            // 重设界面
            initUI()
            
            if tile != gameModel.mtiles{
                // 生成随机数字
                genRandom()
            }
        }
    }
    

    
    // 拿到数字方格的标签
    func removeKeyTile(_ key:IndexPath)
    {
        let tile = tiles[key]
        _ = tileVals[key]
        
        tile!.removeFromSuperview()
        tiles.removeValue(forKey: key)
        tileVals.removeValue(forKey: key)
    }
    
//    func printTiles(tiles:Array<Int>)
//    {
//        let count = tiles.count
//        for i in 0..<count
//        {
//            if (i+1) % Int(dimension) == 0{
//                print(tiles[i])
//            } else {
//                print(tiles[i], separator: "", terminator: "\t")
//            }
//        }
//        print("")
//    }
}
