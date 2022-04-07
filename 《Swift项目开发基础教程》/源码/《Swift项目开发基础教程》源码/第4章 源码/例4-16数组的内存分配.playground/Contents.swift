// 定义一个存放字符串的数组
var array : [String]
// 分配空间
array = [String]()
for element in 0..<128 {
    array.append("张三\(element)")
    print(array[element] + "--容量 \(array.capacity)")
}

