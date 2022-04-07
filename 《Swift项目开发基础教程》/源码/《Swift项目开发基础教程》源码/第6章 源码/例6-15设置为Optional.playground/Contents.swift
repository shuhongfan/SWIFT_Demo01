class Person
{
    var name: String?
    var age: Int?
}
var per1 = Person()
per1.name = "张三"
per1.age  = 20
var per2 = Person()
per2.name = "李四"
per2.age  = 18
print("姓名：\(per1.name)---年龄：\(per1.age) ")
print("姓名：\(per2.name)---年龄：\(per2.age) ")
