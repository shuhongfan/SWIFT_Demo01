class Person {
    //存储属性
    var age = 20
    //计算属性
    var description :String {
        return "我的年龄是\(age)"
    }
    //类型属性
    static var kind = "人类"
}
//定义子类Student，继承自基类Person
class Student: Person {
}
//定义Student对象
let newStudent = Student()
newStudent.age = 18                 //在子类中访问存储属性
print(newStudent.age)               //输出存储属性值
print(newStudent.description)     //输出计算属性值
Student.kind = "学生"               //在子类中访问类型属性
print(Student.kind)                //输出类型属性值
