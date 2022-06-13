protocol rentHouse {
    func take()->String
}
class Agency:rentHouse{
    func take() -> String {
        return "中介给学生租房子"
    }
}
class Student {
    var delegate:rentHouse
    init(man:rentHouse) {
        delegate = man
    }
    func take()->String {
        return delegate.take()
    }
}
let agency = Agency()
let student = Student(man: agency)
print(student.take())

