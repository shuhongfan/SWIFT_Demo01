//定义Animal类
class Animal {
    var name : String
    var leg: Int
    func description()->String{
        return "\(name)有\(leg)条腿"
    }
    init(name: String, leg: Int){
        self.name = name
        self.leg = leg
    }
}
//扩张Animal类
extension Animal{
    //指定构造函数
    convenience init(name:String){
        self.init(name:name, leg:4)
    }
}
let p1 = Animal(name:"Dog")
print("Animal:\(p1.description())")
let p2 = Animal(name: "Duck", leg: 2)
print("Animal:\(p2.description())")

