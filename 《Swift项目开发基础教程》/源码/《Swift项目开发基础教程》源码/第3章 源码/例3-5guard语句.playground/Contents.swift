func guardCase(){
    let oAge: Int? = 20
    guard let age = oAge where age > 18 else{
        print("年龄小于18岁")
        return
    }
    //代码执行到这里，age一定有值且Age > 18
    print(age)
}
guardCase()

