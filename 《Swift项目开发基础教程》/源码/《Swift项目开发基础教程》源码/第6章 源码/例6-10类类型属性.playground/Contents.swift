class Student {
    var livingcost : Double = 0.0
    var name : String = ""
    static var tuition : Double = 11668
    static var tuitionProp : Double {
        return tuition
    }
    var totalCost: Double {
        return Student.tuition + livingcost
    }
}
//访问静态属性
print(Student.tuition)
var aStudent = Student()
//访问实例属性
aStudent.livingcost = 1_000
//访问静态属性
print(aStudent.totalCost)
