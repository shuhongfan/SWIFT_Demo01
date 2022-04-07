// 定义一个坐标原点
let coordinate1 = (0,0)
switch coordinate1{
    case(0,0):
        print("原点")
    case(_,0):
        print("X轴")
    case(0,_):
        print("Y轴")
    case(-2...2,-2...2):
        print("矩形区域")
    default:
        print("没有任何目标区域")
}
