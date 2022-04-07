import UIKit
class NumberOfPeople {
    //声明三个变量储存学校校长、老师和学生的人数
    var principalNumber:Int=1
    var teacherNumber:Int=30
    var studentNumber:Int=100
    //定义下标脚本
    subscript(index:Int)->Int{
        get{
            switch index{
            case 0:
                return principalNumber
            case 1:
                return teacherNumber
            case 2:
                return studentNumber
            default:
                return 0
            }
        }
    }
}
var personNumber = NumberOfPeople()
//遍历输出属性值
for i in 0...2{
    print(personNumber[i])
}

