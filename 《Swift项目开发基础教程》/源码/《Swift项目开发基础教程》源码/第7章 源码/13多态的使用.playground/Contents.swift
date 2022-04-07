//定义基类Animal
class Animal {
    func shout(){
        print("动物发出叫声")
    }
}
//定义子类Cat，继承自Animal
class Cat: Animal {
    override func shout(){
        print("猫在喵喵叫")
    }
}
//定义子类Dog，继承自Dog
class Dog: Animal {
    override func shout() {
        print("狗在汪汪叫")
    }
}

let animal1:Animal = Cat()
let animal2:Animal = Dog()
animal1.shout()
animal2.shout()
