let a = 100
let b = 20.5
let num1 = a + Int(b)            //显式地将b转换为Int类型，计算结果为120
let num2 = Double(a) + b        //显式地将a转换为Double类型，计算结果为120.5
print(num1,num2)