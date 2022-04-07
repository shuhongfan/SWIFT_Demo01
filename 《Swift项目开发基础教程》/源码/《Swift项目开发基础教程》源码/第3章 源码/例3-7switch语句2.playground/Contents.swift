// 定义一个坐标常量
let coordinate2 = (2,2)
switch coordinate2{
    case (0,0):
        print("原点")
    case (let x,0):
        print("x轴")
    case(0,let y):
        print("y轴")
    case(let x,let y):
        print("所有区域")
}
