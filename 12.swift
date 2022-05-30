class Person {
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

class Student: Person {
}

let newStudent = Student()
newStudent.age = 18
newStudent.age = 22
