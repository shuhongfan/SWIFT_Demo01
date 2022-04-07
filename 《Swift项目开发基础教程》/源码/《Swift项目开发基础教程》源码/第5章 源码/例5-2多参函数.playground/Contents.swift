func sayHello(name : String, alreadyGreeted: Bool) -> String{
    if alreadyGreeted {
        return "Hello again, \(name)"
    }else{
        return "Hello, \(name)"
    }
}
print(sayHello(name: "Tom", alreadyGreeted:true))

