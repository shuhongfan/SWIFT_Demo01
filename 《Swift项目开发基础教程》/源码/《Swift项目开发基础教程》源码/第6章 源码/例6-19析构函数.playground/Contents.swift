class Circle {
    let π = 3.145926
    var r: Double
    init(r: Double){
        self.r = r
    }
    deinit{
        print("调用析构函数")
    }
}
    var circle: Circle? = Circle(r: 3)
    print("圆的面积为：\(circle!.π * circle!.r * circle!.r)")
    circle = nil
    var circle1 = Circle(r: 10)
    print("圆的周长为：\(2 * circle1.π * circle1.r)")


