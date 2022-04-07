let coordinate3 = (0,0)
switch coordinate3{
case (0,0):
    print("原点")
    fallthrough
case(_,0):
    print("x轴")
    fallthrough
case(0,_):
    print("y轴")
case(-2...2,-2...2):
    print("矩形区域")
default:
    print("没有任何目标区域")
}


