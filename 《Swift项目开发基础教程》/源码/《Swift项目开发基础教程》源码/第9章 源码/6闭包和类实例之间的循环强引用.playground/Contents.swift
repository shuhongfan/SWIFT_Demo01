class Student{
    var name: String?
    var score: Int
    lazy var level: (Void) -> String = {
        switch self.score {
        case 0..<60:
            return "C"
        case 60..<85:
            return "B"
        case 85..<100:
            return "A"
        default:
            return "D"
        }
    }
    init(name:String, score:Int){
        self.name = name
        self.score = score
    }
    deinit{
        print("Student对象:\(name) 被销毁了")
    }
}
var xiaoMing:Student? = Student(name: "小明", score: 86)
print("\(xiaoMing!.name)成绩水平为：\(xiaoMing!.level())")
xiaoMing = nil
