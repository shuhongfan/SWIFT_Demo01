class Person{
    var name: String
    var age: Int
    init() {
        name = "zhangsan"
        age = 18
    }
    func personInfo(){
        print("姓名:\(name)\n年龄:\(age)")
    }
}
let p = Person()
p.personInfo()
