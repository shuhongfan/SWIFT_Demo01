import UIKit
var dict = ["name" : "小花", "age" : 18]
let dict2 = ["title" : "老大", "name" : "小草"]
// 将dict2的内容合并到dict中
for (k, v) in dict2 {
    dict[k] = v
}
print(dict)
