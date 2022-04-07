//Animal协议
protocol Animal{
    func shout() -> String
}
//协议扩展
extension Animal{
    //协议中新增的方法，并实现
    func eat() -> String {
        return "吃骨头"
    }
}
//采纳Animal协议，并且只需实现shout方法
class Dog: Animal {
    func shout() -> String {
        return "汪汪汪"
    }
}
let dog = Dog()
print("狗的叫声\(dog.shout())")
print("狗的爱好\(dog.eat())")

