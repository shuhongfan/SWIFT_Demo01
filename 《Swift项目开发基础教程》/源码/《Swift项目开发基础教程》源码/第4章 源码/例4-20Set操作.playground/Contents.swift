let a:Set<Int> = [1,2,3,4,5]
let b:Set<Int> = [4,5,6,7,8]
//1.intersection方法
print("intersection方法:", a.intersection(b).sorted())
//2.symmetricDifference方法
print("symmetricDifference方法:",a.symmetricDifference(b).sorted())
//3.union方法
print("union方法:",a.union(b).sorted())
//4.subtracting方法
print("subtracting方法:",a.subtracting(b).sorted())
