protocol Animal{
    // 定义了一个表示叫声的实例方法
    func shout()
}
// Dog类采纳Animal协议
class Dog:Animal {
    // 具体实现Animal中的shout实例方法
    func shout() {
        print("汪汪汪")
    }
}
let dog = Dog()  // 声明一个Dog实例
dog.shout()  // 调用shout方法
