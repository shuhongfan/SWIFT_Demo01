//定义基类
class Animal {
    var legs = 2             //存储属性
    //只读计算属性
    var description:String{
        return "动物"
    }
    //类型属性
    class var kind:String {
        return "动物类"
    }
}
//定义子类Cat，继承自Animal
class Cat: Animal {
    //重写存储属性
    override var legs : Int {
        get{
            return 4
        }
        set {
            self.legs = newValue
        }
    }
    //重写计算属性
    override var description:String{
        return "猫"
    }
    //重写类型属性
    override class var kind:String{
        return "猫类"
    }
}
//定义基类的变量
let animal = Animal()
print("\(animal.description)有\(animal.legs)条腿，属于'\(Animal.kind)'")
//定义子类的变量
let cat = Cat()
print("\(cat.description)有\(cat.legs)条腿，属于'\(Cat.kind)'")
