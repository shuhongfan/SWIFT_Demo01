prefix operator +++ {}
struct Vector2D {
    var x = 0.0, y = 0.0
}
func + (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}
func += ( left: inout Vector2D, right: Vector2D) {
    left = left + right
}
prefix func +++ ( vector: inout Vector2D) -> Vector2D {
    vector += vector
    return vector
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled
print(toBeDoubled)
print(afterDoubling)
