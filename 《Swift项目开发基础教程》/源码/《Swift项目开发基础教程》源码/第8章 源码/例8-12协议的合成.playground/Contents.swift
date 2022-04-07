protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
//结构体Person采纳了Named协议和Aged协议
struct Person: Named, Aged {
    var name: String
    var age: Int
}
//定义一个函数，参数kid的类型是protocol<Named, Aged>，是个临时的类型
func wishHappyBirthday(kid: protocol<Named, Aged>) {
    print("生日快乐\(kid.name) ！ 你已经\(kid.age)岁了!")
}
let birthdayPerson = Person(name: "小明", age: 21)
wishHappyBirthday(kid: birthdayPerson)
