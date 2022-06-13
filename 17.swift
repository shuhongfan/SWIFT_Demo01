class Person {
    let name: String
    var apartment: Apartment?        
    init(name: String) {
        self.name = name
        print("Person构造完成：\(name)")
    }
    deinit {
        print("Person析构完成：\(name)")
    }
}
class Apartment {                   
    let unit: String               
    weak var tenant: Person?       
    init(unit: String) {
        self.unit = unit
        print("公寓构造完成：\(unit)")
    }
    deinit {
        print("公寓析构完成：\(unit)")
    }
}
var xiaoMing: Person?
var unit106: Apartment?
xiaoMing = Person(name: "xiaoMing")
unit106 = Apartment(unit: "unit106")
xiaoMing!.apartment = unit106
unit106!.tenant = xiaoMing
xiaoMing = nil
unit106 = nil
