class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
    deinit{
        print("Country对象被销毁了")
    }
}
class City {
    let name: String
    unowned var country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
    deinit{
        print("City对象被销毁了")
    }
}
var country:Country? = Country(name: "中国", capitalName: "北京")
print("\(country!.name)的首都是\(country!.capitalCity.name)")
country = nil
