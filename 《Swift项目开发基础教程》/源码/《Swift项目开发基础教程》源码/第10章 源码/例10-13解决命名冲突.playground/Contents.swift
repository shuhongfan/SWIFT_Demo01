//定义结构体类型Target1
struct Target1 {
    class MyClass {
        class func hello() {
            print("hello from Target1 ")
        }
    }
}
//定义结构体类型Target2
struct Target2 {
    class MyClass {
        class func hello() {
            print("hello from Target2 ")
        }
    }
}
//分别调用Target1和Target2的同名方法
Target1.MyClass.hello()
Target2.MyClass.hello()
