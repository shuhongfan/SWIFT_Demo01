public struct TrackedString {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    public init() {}
}
public class SomePublicClass {          // 显式的 public 类
    public var somePublicProperty = 0   // 显式的 public 类成员
    var someInternalProperty = 0        // 隐式的 internal 类成员
    private func somePrivateMethod() {} // 显式的 private 类成员
}