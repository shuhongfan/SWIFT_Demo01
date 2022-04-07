//定义基类
class Animal {
    //实例方法
    func move(){
        print("动物会动");
    }
    //类型方法
    class func eat(){
        print("动物会吃东西");
    }
}
//定义子类Cat，继承自Animal
class Cat: Animal {
    //重写实例方法
    override func move() {
        print("猫会跳");
    }
    //重写类型方法
    override class func eat() {
        print("猫会吃东西");
    }
}
//定义基类对象
let animal = Animal()
animal.move()                 //调用基类的实例方法
Animal.eat()                  //调用基类的类型方法
//定义子类对象
let cat = Cat()
cat.move()                    //调用子类的实例方法
Cat.eat()                     //调用子类的类型方法
