func findIndex<T: Equatable>(array: [T], _ valueToFind: T) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
//findIndex函数用于浮点型
let doubleIndex = findIndex(array: [3.14159, 0.1, 0.25], 9.3)
print("9.3在数组中的位置是\(doubleIndex)")
//findIndex函数用于字符串型
let stringIndex = findIndex(array: ["传智iOS", "传智Swift", "传智java"], "传智iOS")
print("传智iOS在数组中的位置是\(stringIndex)")

