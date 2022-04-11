var set = Set<Int>()
repeat {
    var element = Int(arc4random_uniform(50))
    set.insert(element)
} while set.count < 10
print(set.sort())
