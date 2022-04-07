struct Car {
    var brand:String?     //汽车的品牌
    var color:Color        //汽车的颜色
    enum Color{
        case Red,White,Orange,Green,Gray
    }
}
let car = Car(brand: "比亚迪", color: Car.Color.Red)
print(car.color)







