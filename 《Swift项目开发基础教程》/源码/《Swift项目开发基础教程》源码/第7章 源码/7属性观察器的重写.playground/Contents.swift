//定义基类
class Animal {
    //存储属性
    var legs = 2{
        willSet{
            print("Animal willSet \(newValue)")
        }
        didSet{
            print("Animal didSet")
        }
    }
}
//定义子类Cat，继承自Animal
class Cat: Animal {
    //为存储属性添加属性观察器
    override var legs : Int {
        willSet{
            print("Cat willSet \(newValue)")
        }
        didSet{
            print("Cat didSet")
        }
    }
}
//定义子类对象
let cat = Cat()
cat.legs = 3        //改变属性的值
