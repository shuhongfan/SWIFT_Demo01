// 编写一段程序，在程序中设计一个函数，并调用这个函数，实现输出8的n次方的值。

func nnn(n:Int)->Int{
    var i:Int = 1
    for _ in 1...n{
        i=i*8
    }
    return i
}

print(nnn(n:5))
