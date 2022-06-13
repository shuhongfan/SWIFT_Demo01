extension Int {
    static var someInt : Int = 3

    mutating func square() {
        self = self * Int.someInt
    }
}

var num = 6
num.square()
print(num)