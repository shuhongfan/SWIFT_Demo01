struct Vector2D {
    var x = 0.0, y = 0.0
}
//实现加号运算符的重载实现
func + (left:Vector2D,right:Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x,y:left.y + right.y)
}
//使用重载运算符进行运算
let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector
