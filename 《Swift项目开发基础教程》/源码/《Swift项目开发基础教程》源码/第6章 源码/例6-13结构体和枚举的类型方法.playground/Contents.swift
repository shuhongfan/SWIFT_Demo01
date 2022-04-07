
struct Person
{
    static func personName(name: String)->String
    {
        return name
    }
}
//调用Person结构体的personName方法
print(Person.personName(name: "张三"))

//定义枚举类型方法
enum Animal{
    case dog
    case cat
    case mouse
    case elephant
    
    static func animalLifeHabits(){
        print("动物的生活习性")
    }
}
Animal.animalLifeHabits()
