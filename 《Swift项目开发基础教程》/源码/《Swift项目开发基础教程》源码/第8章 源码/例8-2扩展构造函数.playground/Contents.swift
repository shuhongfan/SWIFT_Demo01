struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}
//调用默认构造函数创建
let defaultRect = Rect()
//调用逐一成员构造函数创建实例
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
    size: Size(width: 5.0, height: 5.0))
//扩展构造函数
extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
//调用扩展的构造函数创建实例
let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
    size: Size(width: 3.0, height: 3.0))
print("默认构造函数属性 \(defaultRect)")
print("成员级构造函数属性 \(memberwiseRect)")
print("扩展构造函数属性 \(centerRect)")
