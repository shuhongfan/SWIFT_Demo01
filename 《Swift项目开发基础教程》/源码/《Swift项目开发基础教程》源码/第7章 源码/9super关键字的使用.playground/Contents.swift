class Person {
    //实例属性
    var name: String?
    var age: Int?
    //实例方法
    func description(){
        print("我的名字是\(name)，今年\(age)岁")
    }
    //下标脚本
    subscript (index:Int) -> String{
        switch index {
        case 0:
            return self.name!
        default:
            return ""
        }
    }
}
//定义子类继承自Person类
class Employee : Person {
    //新增实例属性
    var company : String?
    //重写实例属性
    override var age: Int? {
        get{
            return super.age! + 10               //使用super.age访问父类属性
        }
        set {
            super.age = age! - 10                //使用super.age访问父类属性
        }
    }
    //重写实例方法
    override func description(){
        super.description()               //使用super.description访问父类方法
        print("我在\(company)公司上班")
    }
    //重写下标脚本
    override subscript (index:Int) -> String{
        switch index {
        case 1:
            return self.company!
        default:
            return super[index]          //使用super[index]访问父类的下标脚本
        }
    }
}
