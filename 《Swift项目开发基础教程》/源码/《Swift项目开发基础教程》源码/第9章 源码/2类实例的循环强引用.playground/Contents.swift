class Person {
    let name: String
    var apartment: Apartment?    //住在哪个公寓
    init(name: String) {
        self.name = name
        print("Person构造完成：\(name)")
    }
    deinit {
        print("Person析构完成：\(name)")
    }
}
class Apartment {                //公寓类
    let unit: String             //公寓的门牌号
    var tenant: Person?         //公寓的房客
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
xiaoMing = Person(name: "小明")
unit106 = Apartment(unit: "106")
xiaoMing!.apartment = unit106
unit106!.tenant = xiaoMing
xiaoMing = nil
unit106 = nil
