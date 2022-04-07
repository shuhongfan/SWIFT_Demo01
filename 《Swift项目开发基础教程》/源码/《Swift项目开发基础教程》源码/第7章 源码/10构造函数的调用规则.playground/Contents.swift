class Person {
    var name: String
    var age: Int
    func description(){
        print("我的名字是\(name)，今年\(age)岁")
    }
    //指定构造函数
    init(name: String,age: Int){
        self.name = name
        self.age = age
    }
    //便利构造函数
    convenience init(name:String){
        self.init(name:name, age: 20)
    }
    //便利构造函数
    convenience init(){
        self.init(name: "张三")
    }
}
class Employee : Person {
    var company : String
    //指定构造函数
    init(name: String, age: Int, company: String) {
        self.company = company
        super.init(name: name, age: age)
    }
    //指定构造函数
    init(name: String, company: String) {
        self.company = company
        super.init(name: name, age:18)
    }
    //便利构造函数
    convenience override init(name: String, age: Int) {
        self.init(name: name, age: age, company:"Apple公司")
    }
}
