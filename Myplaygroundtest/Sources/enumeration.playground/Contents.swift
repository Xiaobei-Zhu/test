import UIKit

//用枚举表示指南针四个方向
enum CompassPoint {
    case north
    case south
    case east
    case west
}
var directionToHead = CompassPoint.west   //命名为单数


enum Planet : Int {
    case mercury, venus, earth, mars, jupiter, saturn, uranus
}
//枚举原始值的隐式赋值
let earthvalue = Planet.earth.rawValue    //2
//使用switch语句匹配枚举值
directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}
enum Beverage: CaseIterable {
    case caffee, tea, juice
}
let numberOfChices = Beverage.allCases.count     //allCases包含所有枚举成员的集合
print("\(numberOfChices) beverage available")   //3 beverage available
for beverage in Beverage.allCases {
    print(beverage)
}
//枚举条码，二维码
enum Barcode{
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
//如果一个枚举成员的所有关联值都被提取为常量，或者都被提取为变量，为了简洁，你可以只在成员名称前标注一个 let 或者 var
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}
//原始值
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

//使用了可绑定
let positionToFind = 11
if let somePlanet = Planet(rawValue: positionToFind){        //创建了一个可选Planet
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
}else{
    print("There isn't a planet at position \(positionToFind)")
}

//存储简单的算术表达式  递归枚举
enum AirthmeticExpression {
    case number (Int)
    indirect case addition(AirthmeticExpression, AirthmeticExpression)
    indirect case multiplication(AirthmeticExpression)
}
//同上
//indirect enum AirthmeticExpression1 {
//    case number(Int)
//    case addition(AirthmeticExpression1)
//    case multiplication(AirthmeticExpression1)
//}
let five = AirthmeticExpression.number(5)
let four = AirthmeticExpression.number(4)
let sum = AirthmeticExpression.addition(five, four)
let product = AirthmeticExpression.multiplication(sum, four)

func evaluate(_ expression: AirthmeticExpression) ->Int{
    switch expression{
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}
print(evaluate(product))
