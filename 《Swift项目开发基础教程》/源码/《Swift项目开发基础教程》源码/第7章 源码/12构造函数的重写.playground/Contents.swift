class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) 个轮子"
    }
}
let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")
class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}
let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")
