import UIKit
let hour = 8
let minute = 5
let seconds = 6
// 按照format的格式来显示arguments的内容
let dateString = String(format: "%02d:%02d:%02d", arguments:[hour, minute, seconds])
print(dateString)
//按照format的格式拼接hour、minute、seconds的内容
let dateString2 = String(format: "%02d:%02d:%02d", hour, minute, seconds)
print(dateString2)
