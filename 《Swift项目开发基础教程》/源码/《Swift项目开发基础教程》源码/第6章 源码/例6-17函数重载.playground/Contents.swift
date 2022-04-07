
class Person
{
    var name: String
    var age: Int
    init(name: String, age: Int)
    {
        self.name = name
        self.age  = age
    }
}
var per = Person(name: "张三", age: 20)
print("姓名：\(per.name)---年龄：\(per.age)")
