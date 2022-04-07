//
//  GameModel.swift
//  Swift2048
//
//  Created by 光 on 15/12/21.
//  Copyright © 2015年 itcast. All rights reserved.
//

import UIKit

class GameModel{
    var dimension:Int = 0 // 维度
    var tiles:Array<Int>!  // 数组，保存4*4.。
    var mtiles:Array<Int>!  // 重排的数组
    
    var scoreDelegate:ScoreViewProtocol
    var bestScoreDelegate:ScoreViewProtocol
    
    var score:Int = 0
    var bestScore:Int = 0
    
    var maxNumber:Int = 0
    
    init(dimension:Int, maxnumber:Int, score:ScoreViewProtocol, bestScore:ScoreViewProtocol) {
        self.maxNumber = maxnumber
        self.dimension = dimension
        self.scoreDelegate = score
        self.bestScoreDelegate = bestScore
        initTiles()
    }
    
    // 用于检测是否通关
    func isSuccess() -> Bool
    {
        for i in 0..<dimension*dimension
        {
            if tiles[i] >= maxNumber
            {
                return true
            }
        }
        return false
    }
    
    // 用于检测是否通关失败
    func isFailure() -> Bool
    {
        if isFull() == true {
            if checkVertical() == true && checkHorizontal() == true
            {
                // 失败
                return true
            }
        }
        // 没有失败
        return false
    }
    
    // 垂直方向检查
    func checkVertical() -> Bool
    {
        var index = 0
        // 从下向上检查
//        for var i=dimension-1; i>0; i -= 1
        for temp in 1...(dimension-1) {
            let i = dimension - temp
            for j in 0..<dimension
            {
                index = self.dimension * i + j
                // 如果当前行和上一行值相等,返回false
                while (mtiles[index-self.dimension] == mtiles[index])
                {
                    // 没有失败
                    return false
                }
            }
        }
        // 失败
        return true
    }
    
    // 水平方向检查
    func checkHorizontal() -> Bool
    {
        var index = 0
        // 从右向左检查
        for i in 0..<dimension
        {
//            for var j=dimension-1; j>0; j -= 1
            for temp in 1...(dimension-1){
                let j = dimension - temp
                index = self.dimension * i + j
                // 如果当前列和左侧一列值相等,返回false
                while (mtiles[index-1] == mtiles[index])
                {
                    // 没有失败
                    return false
                }
            }
        }
        // 失败
        return true
    }
    
    func initTiles()
    {
        self.tiles = Array<Int>(repeating: 0, count: self.dimension * self.dimension)
        self.mtiles = Array<Int>(repeating: 0, count: self.dimension * self.dimension)
    }
    
    
    func tileChange(_ row: Int,col: Int) ->Bool{
        let index = self.dimension * row + col
        if tiles[index] == mtiles[index]{
            return false
        }
        return true
    }
    // 判断某个位置是否有值，false表示有值
    func setPosition(_ row:Int, col:Int, value:Int) -> Bool
    {
        assert(row >= 0 && row < dimension)
        assert(col >= 0 && col < dimension)
        
        let index = self.dimension * row + col
        let val = tiles[index]
        if val > 0 {
            return false
        }
        tiles[index] = value
        return true
    }
    
    // 检测剩余的空位置
    func emptyPosition() -> [Int]
    {
        var emptytiles = Array<Int>()
        for i in 0..<(dimension * dimension)
        {
            if tiles[i] == 0
            {
                emptytiles.append(i) //
            }
        }
        return emptytiles
    }
    
    // 检测是否满了
    func isFull() -> Bool
    {
        if emptyPosition().count == 0
        {
            return true
        }
        return false
    }
    
    // 将tiles的值搬到mtiles
    func copyToMtiles(){
        for i in 0..<self.dimension * self.dimension
        {
            mtiles[i] = tiles[i]
        }
    }
    
    func copyFromMtiles(){
        for i in 0..<self.dimension * self.dimension
        {
            tiles[i] = mtiles[i]
        }
    }
    
    // 向上重排
    func reflowUp()
    {
        copyToMtiles()
        var index:Int
//        for var i = dimension-1; i>0; i -= 1
        for temp in 1...(dimension-1)
        {
            let i = dimension - temp
            for j in 0..<dimension
            {
                index = self.dimension * i + j
                if (mtiles[index - self.dimension] == 0 ) && (mtiles[index] > 0)
                {
                    mtiles[index - self.dimension] = mtiles[index]
                    mtiles[index] = 0
                    
                    var subindex:Int = index
                    while (subindex + self.dimension < mtiles.count)
                    {
                        if mtiles[subindex + self.dimension] > 0
                        {
                            mtiles[subindex] = mtiles[subindex + self.dimension]
                            mtiles[subindex + self.dimension] = 0
                        }
                        subindex += self.dimension
                    }
                }
            }
        }
        copyFromMtiles()
    }
    
    // 向下重排
    func reflowDown()
    {
        copyToMtiles()
        var index:Int
        for i in 0..<dimension-1
        {
            for j in 0..<dimension
            {
                index = self.dimension * i + j
                if (mtiles[index + self.dimension] == 0 ) && (mtiles[index] > 0)
                {
                    mtiles[index + self.dimension] = mtiles[index]
                    mtiles[index] = 0
                    
                    var subindex:Int = index
                    while (subindex - self.dimension >= 0)
                    {
                        if mtiles[subindex - self.dimension] > 0
                        {
                            mtiles[subindex] = mtiles[subindex - self.dimension]
                            mtiles[subindex - self.dimension] = 0
                        }
                        subindex -= self.dimension
                    }
                }
            }
        }
        copyFromMtiles()
    }
    
    // 向左重排
    func reflowLeft()
    {
        copyToMtiles()
        var index:Int
        for i in 0..<dimension
        {
//            for var j=dimension-1; j>0; j -= 1
            for temp in 1..<dimension
            {
                let j = dimension - temp
                index = self.dimension * i + j
                if (mtiles[index-1] == 0 ) && (mtiles[index] > 0)
                {
                    mtiles[index-1] = mtiles[index]
                    mtiles[index] = 0
                    
                    var subindex:Int = index
                    while (subindex + 1 < i * dimension + dimension)
                    {
                        if mtiles[subindex + 1] > 0
                        {
                            mtiles[subindex] = mtiles[subindex + 1]
                            mtiles[subindex + 1] = 0
                        }
                        subindex += 1
                    }
                }
            }
        }
        copyFromMtiles()
    }
    
    // 向右重排
    func reflowRight()
    {
        copyToMtiles()
        var index:Int
        for i in 0..<dimension
        {
            for j in 0..<dimension - 1
            {
                index = self.dimension * i + j
                if (mtiles[index + 1] == 0 ) && (mtiles[index] > 0)
                {
                    mtiles[index + 1] = mtiles[index]
                    mtiles[index] = 0
                    
                    var subindex:Int = index
                    while (subindex - 1 > i*dimension-1)
                    {
                        if mtiles[subindex - 1] > 0
                        {
                            mtiles[subindex] = mtiles[subindex - 1]
                            mtiles[subindex - 1] = 0
                        }
                        subindex -= 1
                    }
                }
            }
        }
        copyFromMtiles()
    }
    
    // 向上合并
    func mergeUp()
    {
        copyToMtiles()
        var index:Int
//        for var i=dimension-1; i>0; i -= 1
        for temp in 1...(dimension-1)
        {
            let i = dimension - temp
            for j in 0..<dimension
            {
                index = self.dimension * i + j
                // 如果当前行大于0，而且当前行和上一行值相等
                if (mtiles[index] > 0) && (mtiles[index-self.dimension] == mtiles[index])
                {
                    // 将上一行的值变为当前行值的2倍，当前行的值置为0
                    mtiles[index-self.dimension] = mtiles[index] * 2
                    changeScore(mtiles[index] * 2)
                    mtiles[index] = 0
                }
            }
        }
        copyFromMtiles()
    }
    
    // 向下合并
    func mergeDown()
    {
        copyToMtiles()
        var index:Int
        for i in 0..<dimension-1
        {
            for j in 0..<dimension
            {
                index = self.dimension * i + j
                if (mtiles[index] > 0) && (mtiles[index + self.dimension] == mtiles[index])
                {
                    
                    mtiles[index + self.dimension] = mtiles[index] * 2
                    changeScore(mtiles[index] * 2)
                    mtiles[index] = 0
                    
                }
            }
        }
        copyFromMtiles()
    }
    
    // 向左合并
    func mergeLeft()
    {
        copyToMtiles()
        var index:Int
        for i in 0..<dimension
        {
//            for var j=dimension-1; j>0; j -= 1
            for temp in 1...(dimension-1)
            {
                let j = dimension - temp
                index = self.dimension * i + j
                if (mtiles[index] > 0) && (mtiles[index-1] == mtiles[index])
                {
                  
                    mtiles[index-1] = mtiles[index] * 2
                    changeScore(mtiles[index] * 2)
                    mtiles[index] = 0
                    
                }
            }
        }
        copyFromMtiles()
    }
    
    // 向右合并
    func mergeRight()
    {
        copyToMtiles()
        var index:Int
        for i in 0..<dimension
        {
            for j in 0..<dimension-1
            {
                index = self.dimension * i + j
                if (mtiles[index] > 0) && (mtiles[index+1] == mtiles[index])
                {
                    mtiles[index+1] = mtiles[index] * 2
                    changeScore(mtiles[index] * 2)
                    mtiles[index] = 0
                    
                }
            }
        }
        copyFromMtiles()
    }
    
    func changeScore(_ s:Int)
    {
        score+=s
        bestScore = Int(UserDefaults.standard().value(forKey: "BestScore") as! NSNumber)
        if bestScore < score
        {
            bestScore = score
            UserDefaults.standard().set(bestScore, forKey: "BestScore")
        }
        scoreDelegate.changeScore(value: score)
        bestScoreDelegate.changeScore(value: bestScore)
    }
}
