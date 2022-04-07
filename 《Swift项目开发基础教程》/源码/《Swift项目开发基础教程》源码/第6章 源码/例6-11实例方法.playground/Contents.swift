class person {
    //声明一个表示人数的常量personCount
    var personCount = 0
    //声明一个方法，让personCount加1
    func personCountAdditive(){
        personCount += 1
        print(personCount)
    }
    //让personCount加上一个指定的数量
    func personCountAdditiveNumber(amount: Int){
        personCount += amount
        print(personCount)
    }
    //将personCount重置为0
    func reset(){
        personCount = 0
        print(personCount)
    }
}
//实例person类，然后通过实例的点语法使用person类的实例方法。
let per = person()
per.personCountAdditive()
per.personCountAdditiveNumber(amount: 20)
per.reset()
