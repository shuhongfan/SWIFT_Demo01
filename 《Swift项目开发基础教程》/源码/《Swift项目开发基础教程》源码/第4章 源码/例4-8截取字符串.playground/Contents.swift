import UIKit
let string = "HelloWorld!"
// 将string转换为OC的字符串使用，并根据范围来截取子串
let subString = (string as NSString).substring(with: NSMakeRange(1, 5))
print(subString)
