class Fruit {
    
    var apple:Int=0
    
    var banana:Int=0
    
    var orange:Int=0
    //定义下标脚本
    subscript(index:Int)->Int{
        
        get{
            switch index{
            case 0:
                return apple
            case 1:
                return banana
            case 2:
                return orange
            default:
                return 0
            }
        }
        set{
            switch index{
            case 0:
                return apple = newValue
            case 1:
                return banana = newValue
            case 2:
                return orange = newValue
            default:
                return
            }
        }
    }
}

var f = Fruit()
f[0] = 13
f[1] = 53
f[2] = 15
var sum:Int = 0
for i in 0...2{
    sum += f[i]
}
print(sum)



