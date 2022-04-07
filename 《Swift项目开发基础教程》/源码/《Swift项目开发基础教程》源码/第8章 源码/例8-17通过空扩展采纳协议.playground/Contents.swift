//定义一个协议
protocol GetName{
    var getname: String { get }
}
//Student实现了协议，但是并未采纳
struct Student{
    var name: String
    var getname: String {
        return "这个学生的名字是\(name)"    }
}
//通过空扩展采纳协议
extension Student: GetName {}
let people = Student(name: "小明")
//Student实例作为GetName类型使用
let student: GetName = people
//student可以访问到getname
print(student.getname)

