func exchange( _ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}
var numb1 = 100
var numb2 = 200
print("交换之前 numb1 = \(numb1) and numb2 = \(numb2)")
exchange(&numb1, &numb2)
print("交换之后 numb1 = \(numb1) and numb2 = \(numb2)")


