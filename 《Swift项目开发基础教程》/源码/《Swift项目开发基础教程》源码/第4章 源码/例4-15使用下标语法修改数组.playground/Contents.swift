// 定义一个可变数组
var array = ["One", "Two", "Three", "Four", "Five"]
// 使用下标语法修改1个元素
array[0] = "Six"
print(array)
// 使用下标语法修改多个元素
array[1...2] = ["Seven"]
print(array)
// 使用下标语法修改多个元素
array[2...3] = ["Eight", "Nine"]
print(array)
