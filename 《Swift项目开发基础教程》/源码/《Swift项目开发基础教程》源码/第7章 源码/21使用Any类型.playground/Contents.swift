//: Playground - noun: a place where people can play

import UIKit

class Person {
    //实例属性
    var name: String?
    init(name:String){
        self.name = name
    }
}
//定义Employee类继承自Person类
class Employee: Person {
    //新增实例属性
    var company: String?
    init(name: String, company: String){
        self.company = company
        super.init(name: name)
    }
}
//定义Student类继承自Person类
class Student: Person {
    //新增实例属性
    var school: String?
    init(name: String, school: String){
        self.school = school
        super.init(name: name)
    }
}

//使用any操作符
var things = [Any]()
things.append(42)
things.append("hello")
things.append((3.0, 5.0))
things.append(Employee(name: "小红", company:"传智播客"))
things.append({ (name: String) -> String in "你好, \(name)" })

for thing in things {
    switch thing {
    case let someInt as Int:
        print("整数：\(someInt)")
    case let someString as String:
        print("字符串：\"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("元组类型：\(x,y)")
    case let employee as Employee:
        print("员工名称 '\(employee.name)', 所在公司 \(employee.company)")
    case let stringConverter as String -> String:
        print(stringConverter("小明"))
    default:
        print("其他")
    }
}






