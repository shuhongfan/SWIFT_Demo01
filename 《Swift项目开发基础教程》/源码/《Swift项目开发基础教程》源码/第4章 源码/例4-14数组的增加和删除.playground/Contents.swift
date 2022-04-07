// 定义一个可变数组
var array = ["zhangsan", "lisi"]
// 在末尾追加1个元素
array.append("wangwu")
print(array)
// 向指定位置插入1个元素
array.insert("zhaoliu", at: 2)
print(array)
// 删除第1个元素
array.removeFirst()
print(array)
// 删除最后1个元素
array.removeLast()
print(array)
// 删除指定位置的元素
array.remove(at: 1)
print(array)
// 删除所有的元素
array.removeAll(keepingCapacity: true)
print(array)
