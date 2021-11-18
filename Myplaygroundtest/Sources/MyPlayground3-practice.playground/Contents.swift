import UIKit
//for循环，while循环，if，switch判断，guard，控制流continue，break，fallthrough,检测API正确性

var str = "Hello, playground"
//for循环
for index in 1...3{
    print("\(index) times 6 is \(index * 6)")
}
let num1 = 0
let num2 = 20
for index in stride(from: num1, to: num2, by: 5){
    print(index) //0,5,10,15不包含20
} //stride(...to...)前闭后开区间
for index in stride(from: num1, through: num2, by: 10){
    print(index)  //10，20。包含20
}  //stride(...through..)前闭后闭区间
//while循环
let finalSquare = 25
var board = [Int](repeating : 0, count: finalSquare)
board[03] = +08
board[06] = +11
board[09] = +09
board[10] = +02
board[14] = -10
board[19] = -11
board[22] = -02
board[24] = -08
var square = 0
var diceRoll = 0
//while语句
//while square < finalSquare {
//    diceRoll += 1
//    if diceRoll == 7{
//        diceRoll = 1
//    }
//    square = square + diceRoll
//    if square < board.count{
//        square += board[square]
//    }
//}
print("Game over!")
//repeat...while语句
repeat{
    square += board[square]
    diceRoll += 1
    if diceRoll == 7{
        diceRoll = 1
    }
    square += diceRoll
}while square < finalSquare
//if语句。不需要完整判断时  不会打印任何
let temperatuFahrenheit = 72
if temperatuFahrenheit  <= 32{
    print("It's very cold. Consider wearing a scarf.")
}else if temperatuFahrenheit >= 86{
    print("It's really warm. Don't forget to wear sunscreen.")
}
//switch
let someCharacter1: Character = "a"
switch someCharacter1 {
case "a":
    print("The letter is \(someCharacter1)")
case "z":
    print("The letter is \(someCharacter1)")
default:
    print("Some other character")
}
//switch复合匹配
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a","A":
    print("The letter is A")
default:
    print("The letter is not A")
}
//swich 区间匹配
let approximateCount = 62
let countedThings = "moon orbiting Saturn"
let naturalcount:String
switch approximateCount {
case 0:
    naturalcount = "no"
case 1..<5:
    naturalcount = "A few"
case 5..<12:
    naturalcount = "several"
case 12..<100:
    naturalcount = "dozens of"
default:
    naturalcount = "many"
}
print("There are \(naturalcount) \(countedThings)")
//元组匹配
let somePoint = (1,1)
switch somePoint {
case (0,0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2,-2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}
//值绑定。
let anotherPoint = (2, 2)
switch anotherPoint{
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
//where语句判断额外的调件
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint{
case let (x, y) where  x == y:
    print("(\(x),\(y) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
//复合型cases
let someCharacter2: Character = "e"
switch someCharacter2 {
case "a", "e", "i", "o", "u":
    print("\(someCharacter2) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z" :
    print("\(someCharacter2) is a consonant")
default:
    print("\(someCharacter2) is not a vowel or a consonant")
}
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}
//continu
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput{
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)
//break
let numberSymbol: Character = "五"
var possibleIntergerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntergerValue = 1
case "2", "٢", "二", "๒":
    possibleIntergerValue = 2
case "3", "٣", "三", "๓":
    possibleIntergerValue = 3
case "4", "٤", "四", "๔":
    possibleIntergerValue = 4
default:
    break
}
if let intergerValue = possibleIntergerValue {
    print("The interger value of \(numberSymbol) is \(intergerValue)")
}else{
    print("An integer value could not be found for \(numberSymbol).")
}
//贯穿。fallthrough
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number,and also"
    fallthrough
case  4, 6, 8, 10:
    description += " 4, 6, 8, 10 is not zhishu"
    fallthrough
default:
    description += " an integer."
}
print(description)
// 带标签的语句
//let finalSquare1 = 25
//var board2 = [Int](repeating : 0, count: finalSquare1 + 1)
//gameLoop: while square != finalSquare1{
//    diceRoll += 1
//    if diceRoll == 7{
//        diceRoll = 1
//    }
//    switch square + diceRoll {
//    case finalSquare1:
//        break gameLoop
//    case let newSquare where newSquare > finalSquare1:
//        continue gameLoop
//    default:
//        square += diceRoll
//        square += board[square]
//    }
//}
//print("Game over!")
//guard 提前退出
func greet(person: [String: String]){
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name) !")
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
                return
    }
    print("I hope the weather is nice in \(location).")
}
greet(person: ["name" : "John"])
greet(person: ["name" : "John", "location": "Cupertino"])
if #available(iOS 10, macOS 10.12, *){
    print("yes")
}else{
    print("No")
}
