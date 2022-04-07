// 计算平均数
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
print(arithmeticMean(numbers: 1, 2, 3, 4, 5))
print(arithmeticMean(numbers: 3, 8.25, 18.75))

