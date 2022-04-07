struct Vector2D {
    var x = 0.0, y = 0.0
}
//实现单目负号运算符的重载
prefix func - (vector: Vector2D) -> Vector2D {
    return Vector2D(x: -vector.x, y: -vector.y)
}
//使用重载运算符进行运算
let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
let alsoPositive = -negative
print(negative)
print(alsoPositive)

