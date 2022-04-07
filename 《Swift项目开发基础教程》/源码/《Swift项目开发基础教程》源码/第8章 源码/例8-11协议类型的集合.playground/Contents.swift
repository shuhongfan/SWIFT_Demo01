protocol Animal{
    var name:String {get}
}
//类A
class A :Animal{
    var name: String {
        return "狗"
    }
}
//结构体B
struct B :Animal{
    var name: String {
        return "猫"
    }
}
//类C
class C :Animal{
    var name: String {
        return "猴"
    }
}
let a = A()
let b = B()
let c = C()
//定义Animal类型的数组
let animals: [Animal] = [a, b, c]
for animal in animals {
    print(animal.name)
}

