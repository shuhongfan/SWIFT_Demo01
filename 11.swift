class Shape {
    func draw() {
        print("画形状")
    }
}

class Circle:Shape{
    override func draw() {
        print("画圆形")
    }
}

class Square:Shape{
    override func draw() {
        print("画方形")
    }
}

func drawShape(shape:Shape) {
    shape.draw()
}

drawShape(Shape())
drawShape(Circle())
drawShape(Square())