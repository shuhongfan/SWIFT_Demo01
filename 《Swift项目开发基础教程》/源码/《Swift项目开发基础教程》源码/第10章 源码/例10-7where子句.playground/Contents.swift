import UIKit
protocol Container {
    associatedtype ItemType
    mutating func append(_ item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}
extension Array: Container {}
struct Stack<Element>: Container {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // Container 协议的实现部分
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

func allItemsMatch<
    C1: Container, C2: Container
    where C1.ItemType == C2.ItemType, C1.ItemType: Equatable>
    (_ someContainer: C1, _ anotherContainer: C2) -> Bool
{
    // 检查两个容器含有相同数量的元素
    if someContainer.count != anotherContainer.count {
        return false
    }
    // 检查每一对元素是否相等
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    // 所有元素都匹配，返回 true
    return true
}
//使用allItemsMatch(_:_:)函数
var stackOfStrings = Stack<String>()
stackOfStrings.push( "A")
stackOfStrings.push("B")
stackOfStrings.push( "C")
var arrayOfStrings = ["A", "B", "C"]
if allItemsMatch( stackOfStrings, arrayOfStrings) {
    print("所有的元素都匹配.")
} else {
    print("存在不匹配的元素.")
}



