import UIKit
let string = "HelloWorld"
let len1 = string.lengthOfBytes(using: String.Encoding.utf8)
print(len1)
let len2 = string.characters.count
print(len2)
