enum Student {
    case iOS
    case Java
    case PHP
    case nodejs
   static var tuition : Double = 11668
    static var tuitionProp : Double {
        return tuition
    }
    var instanceProp : Double {
        switch (self) {
        case iOS:
            Student.tuition = 11667
        case Java:
            Student.tuition = 11669
        case PHP:
            Student.tuition = 11666
        case nodejs:
            Student.tuition = 11668
        }
        return Student.tuition + 1_000
    }
}
//访问静态属性
print(Student.tuitionProp)
var aStudent = Student.iOS
//访问实例属性
print(aStudent.instanceProp)
