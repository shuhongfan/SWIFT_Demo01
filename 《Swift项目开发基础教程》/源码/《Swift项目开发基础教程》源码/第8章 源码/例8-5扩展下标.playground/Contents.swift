extension Int {
    subscript(index: Int) -> Int {
        var base = 1
        for _ in 0..<index {
            base *= 10
        }
        return (self / base) % 10
    }
}
print("输出个位的值：\(7463[0])")
print("输出十位的值：\(7463[1])")
print("输出百位的值：\(7463[2])")
print("输出千位的值：\(7463[3])")
print("输出万位的值：\(7463[4])")
print("输出十万位的值：\(7463[5])")
