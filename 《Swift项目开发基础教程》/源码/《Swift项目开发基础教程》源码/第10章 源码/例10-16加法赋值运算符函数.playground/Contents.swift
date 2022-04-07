struct Vector2D {
    var x = 0.0, y = 0.0
}
func + (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}
//定义加法赋值运算符的重载实现
func += ( left: inout Vector2D, right: Vector2D) {
    left = left + right
}
//使用
var original = Vector2D(x: 2.0, y: 3.0)
let vectorToAdd = Vector2D(x: 3.0, y: 5.0)
original += vectorToAdd
print(original)
