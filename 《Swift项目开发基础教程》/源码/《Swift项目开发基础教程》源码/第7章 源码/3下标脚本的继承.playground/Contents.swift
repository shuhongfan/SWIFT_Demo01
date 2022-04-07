class Person {
    var oldName = "I like Swift"
    var newName = "I like Objective-C"
    var currentName = "I like C"
    subscript(index:Int)->String{
        switch index{
        case 0:
            return oldName
        case 1:
            return newName
        case 2:
            return currentName
        default:
            return "I like Itcast"
        }
    }
}
//定义子类Student，继承自基类Person
class Student: Person {
}
//定义Student对象
let newStudent = Student()
print(newStudent[0])
print(newStudent[5])
