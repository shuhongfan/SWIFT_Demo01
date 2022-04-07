func findStringIndex(array: [String], _ valueToFind: String) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let strings = ["Beijing", "Shagnhai", "Guangzhou", "Zhengzhou", "Xi'an"]
if let foundIndex = findStringIndex(array: strings, "Shagnhai") {
    print("Shagnhai 在数组中的位置是 \(foundIndex)")
}


