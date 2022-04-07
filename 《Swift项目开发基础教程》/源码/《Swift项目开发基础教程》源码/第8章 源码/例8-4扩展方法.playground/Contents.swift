extension Int {
    static var num : Int = 4//腿个数
    //定义普通方法legInt
    func legInt() -> Int{
        return self * Int.num
    }
    //定义可变legInt1
    mutating func legInt1() {
        self = self * Int.num
    }
}
let cat = 6.legInt()
print("6只猫有\(cat)条腿")
var cat1 = 6
cat1.legInt1()
print("6只猫有\(cat1)条腿")

