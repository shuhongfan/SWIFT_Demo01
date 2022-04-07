
class Life {
    var name:String?                      //名称属性
    func breathe()  {                     //呼吸方法
        print(self.name ?? "我", "会呼吸")
    }
}
class Animal : Life {           //继承自Life类
    var legs = 0                   //增加legs属性
    func move () {               //增加了move方法
        print(self.name ?? "我","会移动")
    }
}

let life = Life()         //定义一个life对象
life.name = "生物"       //给对象的name属性赋值
life.breathe()           //调用对象的呼吸方法

let cat = Animal()         //定义一个Animal对象
cat.name = "猫"           //给对象的name属性赋值
cat.legs = 4              //给对象的legs属性赋值
cat.breathe()               //调用呼吸方法
cat.move()                   //调用移动方法
print(cat.name ?? "","有\(cat.legs)条腿")          //输出动物有几条腿








