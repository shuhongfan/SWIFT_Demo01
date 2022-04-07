//Animal协议
protocol Animal{
    var getname:String{get}
}
//Dog类
class Dog {
    func shout() -> String {
        return "汪汪汪"
    }
}
//通过扩展使得Dog类采纳并实现Animal协议
extension Dog:Animal{
    var getname:String{
        return "狗"
    }
}
let dog = Dog()
//访问Dog类自己拥有的shout方法
print("狗的叫声\(dog.shout())")
//访问Dog类通过扩展拥有的getname属性
print("dog是\(dog.getname)")

