protocol Animal
{
    var leg:String{ get set }
    var wing:String{ get set}
    func description()->String
}
//Fish协议继承自Animal
protocol Fish: Animal
{
    var habit:String{ get set}
}
// Goldfish类采纳Fish协议
class Goldfish :Fish{
    //定义一个name属性
    var name:String
    //实现Fish协议的要求
    var habit:String
    //实现Animal协议的要求
    var leg:String
    var wing:String
    func description()->String{
        return "name: \(name) wing:\(wing) leg:\(leg) habit:\(habit) "
    }
    init(name:String, leg: String, wing: String, habit: String){
        self.leg = leg
        self.wing = wing
        self.habit = habit
        self.name = name
    }
}
let fish = Goldfish(name:"金鱼",leg:"无腿", wing:"无翅膀", habit:"会游泳")
print(fish.description())

