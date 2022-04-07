import UIKit
let finalSquare = 25
var board = [Int](repeating: 0,count: finalSquare + 1)
//3号方块是梯子的底部，会让你向上移动到11号方格，我们使用board[03]等于+08，其余同样
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
while square < finalSquare
{
    // 使用1~6随机数模拟掷骰子效果
    let diceRoll = Int(arc4random() % 6) + 1
    print(diceRoll)
    // 根据点数移动角色
    square += diceRoll
    if square < board.count
    {
        // 如果玩家还在棋盘上，在蛇头则顺着蛇滑下去，在梯子底则顺着梯子上去
        square += board[square]
    }
}

