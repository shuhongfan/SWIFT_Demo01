struct Vector2D {
    var x = 0.0, y = 0.0
}
//定义等价运算符的自定义实现
func == (left: Vector2D, right: Vector2D) -> Bool {
    return (left.x == right.x) && (left.y == right.y)
}
//定义不等运算符的自定义实现
func != (left: Vector2D, right: Vector2D) -> Bool {
    return !(left == right)
}
//使用自定义的等价运算符
let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("这两个向量是相等的.")
}
