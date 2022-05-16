class Student {
    var name:String
    var age:Int
    init(name:String,age:Int){
        self.name=name
        self.age=age
    }
    func show(){
        print("姓名："+name)
        print("年龄："+age)
    
    }    
}

class UnderGraduate:Student{
    var major:String
    init(name:String,age:Int,major:String){
        super.init(name:name,age:age)
        self.major=major
    }
    func show(){
        print("姓名："+name)
        print("年龄："+age)
        print("专业："+major)
    }   
}

let stu = UnderGraduate(name:"小明",age:19,major:"信息工程")
stu.show()