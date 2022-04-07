class Person{
    //普通属性
    var name: String?
    var age: Int = 0
        {
        //在age属性发生变化之前做点什么
        willSet
        {
            print("将要设置年龄的值为 \(newValue) ")
        }
        //在age属性发生变化之后，更新一下name这个属性
        didSet
        {
            if age < 10
            {
                name = "lucy"
            }else
            {
                name = "lily"
            }
            print("\(name!)的年龄从 \(oldValue) 改为\(age)")
        }
    }
}
let per = Person()
per.age = 0
per.age = 20
