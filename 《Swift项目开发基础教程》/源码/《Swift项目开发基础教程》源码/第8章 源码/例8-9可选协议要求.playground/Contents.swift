import UIKit
@objc protocol Animal {
    //定义可选方法
   @objc optional func wing()
}
class Bird:Animal{
    //实现可选方法
    @objc func wing() {
        print("鸟有翅膀")
    }
}
class Dog:Animal{
}
let bird = Bird()
bird.wing()

