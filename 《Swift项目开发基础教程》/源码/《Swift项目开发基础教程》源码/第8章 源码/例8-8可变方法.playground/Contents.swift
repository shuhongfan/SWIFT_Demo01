protocol Button {
    //定义可变方法
    mutating func toggle()
}
enum OnOffSwitch: Button {
    case Off, On   //定义两个枚举值，Off表示关，On表示开
    mutating func toggle() {
        // 使用三目运算符判断开关的状态，并进行切换
        self = (self==On) ? Off : On
    }
}
//设置开关状态为关
var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()
print("调用toggle方法后电灯开关的状态是\(lightSwitch)")
lightSwitch.toggle()
print("再次调用toggle方法后电灯开关的状态是\(lightSwitch)")


