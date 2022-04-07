class Person {
    let name: String
    let age:Int
    init(name: String, age:Int) {
        self.name = name
        self.age = age
        print("对象构造完成：\(name)")
    }
    deinit {
        print("对象析构完成：\(name)")
    }
}
//定义3个变量，引用同一个实例
var reference1: Person?
var reference2: Person?
var reference3: Person?
reference1 = Person(name: "小明", age: 21)    // 输出：“对象构造完成：小明”
reference2 = reference1
reference3 = reference1
reference1 = nil
reference2 = nil
reference3 = nil   // 输出：“对象析构完成：小明”

