class Person {
    //定义类型属性
    static var name:String = "程序员"
    //定义类型方法
    static func introduce(){
        print("请叫我\(name)")
    }
    //定义实例方法
    func read(name:String, byTimes:Int){
        print("我看了\(byTimes)遍《\(name)》")
    }
}
//定义子类Student，继承自基类Person
class Student: Person {
}
//定义Student对象
let newStudent = Student()
newStudent.read(name: "Swift开发入门教程", byTimes: 5)         //调用实例方法
Student.introduce()                                          //调用类型方法
