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

//使用as操作符
let employee1 = Employee(name: "小明", company: "Apple公司")
let employee2 = Employee(name: "小红", company: "传智播客公司")
let student1 = Student(name: "小华", school: "北京大学")
let members = [employee1,employee2,student1]
for item in members {
    if let employee = item as? Employee{
        print("员工公司:\(employee.company)")
    } else if let student = item as? Student {
        print("学生学校:\(student.school)")
    }
}






