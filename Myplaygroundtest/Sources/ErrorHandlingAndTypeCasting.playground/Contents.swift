import UIKit
//错误处理、类型转换、嵌套类型
var str = "Hello, playground"

//表示与抛出错误
enum VendingMachineError: Error {
    case invalidSelection   //选择无效
    case insufficientFunds(coinsNeeded: Int)  //金额不足
    case outOfstock    //缺货
}
throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

//错误处理
struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfstock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
    }
}
let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine:VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
    print("Success! Yum.")
}catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
}catch VendingMachineError.outOfstock{
    print("Out of Stock.")
}catch VendingMachineError.insufficientFunds(let coinsNeeded){
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}catch{
    print("Unexpected error: \(error).")
}

