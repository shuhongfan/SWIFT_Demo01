func calculate(opr : String) -> (Int, Int) -> Int {
    // 定义加法函数
    func add(a : Int, b : Int) -> Int {
        return a + b
    }
    // 定义减法函数
    func sub(a : Int, b : Int) -> Int {
        return a - b
    }
    // 定义一个局部变量
    var result : (Int, Int) -> Int
    switch (opr) {
    case "+" :
        result = add
    case "-" :
        result = sub
    default :
        result = add
    }
    return result
}
let f1:(Int, Int) -> Int = calculate(opr: "+")
print("10 + 5 = \(f1(10, 5))")
let f2:(Int, Int) -> Int = calculate(opr: "-")
print("10 - 5 = \(f2(10, 5))")

