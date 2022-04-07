import UIKit
class NumberOfPeople {
    
    var principalNumber:Int=0
    
    var teacherNumber:Int=0
    
    var studentNumber:Int=0
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
        set{
            switch index{
            case 0:
                return principalNumber = newValue
            case 1:
                return teacherNumber = newValue
            case 2:
                return studentNumber = newValue
            default:
                return
            }
        }
    }
}

var personNumber = NumberOfPeople()
personNumber[0] = 1
personNumber[1] = 30
personNumber[2] = 100
var sum:Int = 0
for i in 0...2{
    sum += personNumber[i]
}
print(sum)



