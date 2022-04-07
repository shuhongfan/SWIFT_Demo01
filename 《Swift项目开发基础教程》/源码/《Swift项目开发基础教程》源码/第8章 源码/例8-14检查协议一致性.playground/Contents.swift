protocol Area{
    var area:Double{get}
}
//定义采纳了Area协议的类Rectangle
class Rectangle:Area {
    let long:Double
    var area:Double {return long * long}
    init(long:Double){
        self.long = long
    }
}
//定义采纳了Area协议的类Circle
class Circle:Area{
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}
//定义没有采纳Area协议的类Bird
class Bird{
    var wing: Int
    init(wing: Int) { self.wing = wing }
}
//定义AnyObject类型的数组
let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Rectangle(long: 2.0),
    Bird(wing: 2)
]
for object in objects{
    if let objectWithArea = object as? Area{
        print("面积是\(objectWithArea.area)")
    }else{
        print("没有面积")
    }
}

