import UIKit
class Person: NSObject
{
    var name: String
    var age: Int
    //重写默认的构造函数
    //父类提供了这个函数，而子类需要对父类的函数进行扩展，叫做重写
    //特点：可以super.xxx调用父类本身的方法
    override init() {
        name = "张三"
        age = 18
        //调用父类的构造函数
        super.init()
    }
}
let per = Person()
print("姓名：\(per.name)---年龄：\(per.age)")
