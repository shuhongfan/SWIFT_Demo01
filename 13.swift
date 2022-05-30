class Student {
    var name:String
    var age:Int
    init(name:String, age:Int){
        self.name = name
        self.age = age
    }
    
    func show(){
        print("该学生的名字是\(name),年龄是\(age)")
    }
}
class UnderGraduate: Student {
    var major:String
    init(name:String, age:Int, major:String){
        self.major = major
        super.init(name: name, age: age)
    }
    
    override func show() {
        print("该本科生的名字是\(name)，年龄是\(age)，专业是\(major)")
    }
}
let undergraduate = UnderGraduate(name: "小明", age: 19, major: "信息工程")
undergraduate.show()
