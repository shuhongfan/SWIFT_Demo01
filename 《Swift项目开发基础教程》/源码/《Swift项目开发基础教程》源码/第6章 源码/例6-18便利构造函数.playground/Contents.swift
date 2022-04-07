import UIKit
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "UnNamed")
    }
}
let person1 = Person(name: "张三")
let person2 = Person()
print(person1.name)
print(person2.name)

