//定义Person协议
protocol Person {
    var fullName: String { get }
}
class Student:Person{
    var surname:String
    var name:String
    init(surname:String, name:String){
        self.surname = surname
        self.name = name
    }
    //实现协议中的属性
    var fullName:String{
        return surname + name
    }
}
let student = Student(surname: "王", name: "小明")
print(student.fullName)
