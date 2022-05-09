class Person{
    //普通属性
    var name: String?
    var age: Int = 0
        {
        willSet
        {
            print("将要设置年龄的值为 \(newValue) ")
        }
        didSet
        {
            if age > 20
            {
                name = "张三"
            }else
            {
                name = "李四"
            }
            print("\(name!)的年龄从 \(oldValue) 改为\(age)")
        }
    }
}
let per = Person()
per.age = 21
per.age = 20
