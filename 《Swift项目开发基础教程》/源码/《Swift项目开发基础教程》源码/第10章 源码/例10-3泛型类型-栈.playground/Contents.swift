//定义一个泛型栈
struct Stack<Element> {
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
//创建一个String类型的栈实例
var stackOfStrings = Stack<String>()
//向栈中添加元素
stackOfStrings.push(item: "A")
stackOfStrings.push(item: "B")
stackOfStrings.push(item: "C")
stackOfStrings.push(item: "D")
// 从栈中移除一个元素
let fromTheTop = stackOfStrings.pop()
print("fromTheTop的值是\(fromTheTop)")

