class Student{               //定义学生类
    var number: Int = 0       //定义学生编号属性
    var name: String = ""     //定义学生姓名属性
    var heigh: Int = 0       //定义学生身高属性
    var weight: Int = 0		  //定义学生体重属性
    func demo()
    {
        print("Student")
    }
}
let stu = Student()
stu.name = "小明"
stu.demo()
print(stu.name)
