//: Playground - noun: a place where people can play

import UIKit

enum EnrollError: ErrorProtocol {
    case InvalidSelection                    //选择无效
    case InsufficientFunds(coinsNeeded: Int) //金额不足
    case OutOfQualifications                 //没有资格
}

struct Item {
    var price: Int
    var count: Int
}

class VendingCourse {
    var inventory = [
        "传智iOS": Item(price: 12000, count: 7),
        "传智Java": Item(price: 10000, count: 4),
        "传智PHP": Item(price: 7000, count: 11)
    ]
    var coinsDeposited = 0
    var countRest = 0
    func dispenseCourse(snack: String) {
        print("Dispensing \(snack)")
    }
    
    func vend(itemNamed name: String) throws {
        guard var item = inventory[name] else {
            throw EnrollError.InvalidSelection
        }
        
        guard item.count > 0 else {
            throw EnrollError.OutOfQualifications
        }
        
        guard item.price <= coinsDeposited else {
            throw EnrollError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        item.count -= 1
        inventory[name] = item
        dispenseCourse(snack: name)
    }
}
let favoriteCourse = [
    "Alice": "传智iOS",
    "Bob": "传智Java",
    "Eve": "传智PHP",
]
func buyFavoriteCourse(person: String, vendingCourse: VendingCourse) throws {
    let courseName = favoriteCourse[person] ?? "传智iOS"
    try vendingCourse.vend(itemNamed: courseName)
}
let vendingCourse = VendingCourse()
vendingCourse.coinsDeposited = 8000
do {
    try buyFavoriteCourse(person: "Alice", vendingCourse: vendingCourse)
} catch EnrollError.InvalidSelection {
    print("选择无效.")
} catch EnrollError.OutOfQualifications {
    print("还没有达到报名资格.")
} catch EnrollError.InsufficientFunds(let coinsNeeded) {
    print("金额不足. 请再添加 \(coinsNeeded) 元.")
} catch{
    print("未知错误")
}

