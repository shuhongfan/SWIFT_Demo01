//创建Person基类
class Person {
    var name: String
    var age: Int
    func description(){
        print("我的名字是\(name)，今年\(age)岁")
    }
    //自定义指定构造函数
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    //自定义便利构造函数
    convenience init(){
        self.init(name: "张三", age: 18)
    }
}
//创建Employee类，继承自Person类
class Employee : Person {
    var company : String        //新增属性，没有默认值
    //自定义指定构造函数
    init(name: String, age: Int, company: String) {
        self.company = company
        super.init(name: name, age: age)
    }
    //重写父类的指定构造函数，并将它重写为便利构造函数
    convenience override init(name: String, age: Int) {
        self.init(name: name, age: age, company:"Apple公司")
    }
}
//创建Manager类，继承Employee类
class Manager : Employee {
    var level: Int = 1              //新增存储属性，有默认值
}
