protocol Name{
    var name:String {get}
}
struct Student :Name{
    var name:String
}
//参数student的类型为Name
func contact(student:Name){
    print("要联系的学生的名字是\(student.name)")
}
//定义采纳了Name协议的Student的实例
let student = Student(name: "小明")
contact(student: student)

