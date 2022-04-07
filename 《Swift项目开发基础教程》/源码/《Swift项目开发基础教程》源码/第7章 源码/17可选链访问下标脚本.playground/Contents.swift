

import UIKit

class Person {
    var residence: Residence?
}

class Room {
    let name: String
    init(name: String) { self.name = name }
}

class Address {
    var buildingName: String?           //大厦名称
    var buildingNumber: String?         //大厦编号
    var street: String?                   //大厦所在街道名称
    func buildingIdentifier() -> String? {          //返回大厦的标识
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil && street != nil {
            return "\(buildingNumber) \(street)"
        } else {
            return nil
        }
    }
}

class Residence {
    var rooms = [Room]()                //所有的房间
    var numberOfRooms: Int {           //返回房间数量
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("一共有 \(numberOfRooms)个房间")
    }
    var address: Address?            //住所的地址
}


//可选链访问下标脚本
let xiaoMing = Person()
let xiaoMingHouse = Residence()
xiaoMingHouse.rooms.append(Room(name: "客厅"))
xiaoMingHouse.rooms.append(Room(name: "厨房"))
xiaoMing.residence = xiaoMingHouse

xiaoMing.residence?[0] = Room(name: "卧室")
if let firstRoomName = xiaoMing.residence?[0].name {
    print("第一个房间是 \(firstRoomName)。")
} else {
    print("无法获取第一个房间的名称。")
}






