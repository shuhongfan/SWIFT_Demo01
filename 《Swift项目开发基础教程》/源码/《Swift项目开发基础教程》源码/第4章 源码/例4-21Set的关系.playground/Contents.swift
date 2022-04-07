let a:Set<Int> = [1,2,3,4,5]
let b:Set<Int> = [1,2]
let c:Set<Int> = [4,5,6,7,8]
let d:Set<Int> = [1,2]
print("b是a的子集",b.isSubset(of: a))
print("a是b的父集",a.isSuperset(of: b))
print("b和c没有交集",b.isDisjoint(with: c))
print("b和d相等",b == d)
