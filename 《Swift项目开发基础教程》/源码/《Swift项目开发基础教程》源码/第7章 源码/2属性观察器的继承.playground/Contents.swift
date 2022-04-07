class Person {
    //存储属性
    var age = 20 {
        willSet{
            print("新的年龄是\(newValue)")
        }
        didSet{
            if (age > oldValue) {
                print("比原来多了\(age - oldValue)岁")
            } else {
                print("比原来少了\(oldValue - age)岁")
            }
        }
    }
}
//定义子类Student，继承自基类Person
class Student: Person {
}
//定义Student对象
let newStudent = Student()
newStudent.age = 18                  //更改属性的值
newStudent.age = 22                  //更改属性的值
