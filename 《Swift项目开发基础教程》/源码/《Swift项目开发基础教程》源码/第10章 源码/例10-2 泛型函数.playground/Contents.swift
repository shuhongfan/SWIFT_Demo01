func exchangeGeneyics<T>(a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}
var DoubleA = 3.00
var DoubleB = 107.77
print("交换之前 DoubleA = \(DoubleA) and DoubleB = \(DoubleB)")
exchangeGeneyics(a: &DoubleA, &DoubleB)
print("交换之后 DoubleA = \(DoubleA) and DoubleB = \(DoubleB)\n")
//定义两个String类型的变量并进行交换
var StringA = "传智播客"
var StringB = "欢迎你"
print("交换之前 StringA = \(StringA) and StringB = \(DoubleB)")
exchangeGeneyics(a: &StringA, &StringB)
print("交换之后 StringA = \(StringA) and StringB = \(StringB)")
//exchangeGeneyics(a: &StringA, &DoubleB)


